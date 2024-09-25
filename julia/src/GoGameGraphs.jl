module GoGameGraphs

using LinearAlgebra
using Graphs: SimpleGraph, SimpleDiGraph, nv, vertices, outneighbors

export go_board_graph, go_game_graph
export Board, GameGraph, export_graph, unique_graphs, smallest_isomorphic_id,
       is_board_graph_connected, remap

"""
    go_board_graph(n::Integer)

Construct an undirected graph according to the numbering scheme of the
GoGameGraphs package. The graph is returned as a `Graphs.SimpleGraph`.
"""
function go_board_graph(n::Integer)
    adjacency_list = Board(n).edges
    return SimpleGraph(sum(length.(adjacency_list)) ÷ 2, adjacency_list)
end

"""
    go_game_graph(board_graph::Graphs.SimpleGraph)

Return the directed graph corresponding to playing the game of go on
the undirected graph `board_graph`. Although go is traditionally
played on a square grid, the rules can be applied to any undirected
graph. All the possible board positions act as vertices in the game
graph and the moves as edges. The empty board corresponds to vertex 1.
The result is a sparse directed and strongly connected graph with lots
of cycles. It is returned as a `Graphs.SimpleDiGraph`.

The size of the game graph grows exponentially with the number of
vertices in the corresponding board graph. This function supports
board graphs of up to 12 vertices. The size limit can be overridden
but you have been warned.

    go_game_graph(board_graph::SimpleGraph; allow_self_capture = false)

The keyword argument `allow_self_capture` can be set to `false` to
disallow moves that causes the player to lose his own stones. This
results in a game graph with fewer edges than when self captures are
allowed.

(Side note: all variations of go rules agree on the mechanics of
playing moves but can have different opinions about which moves are
valid. Whether to allow multi-stone self captures is one such
difference. However, all go rules agree that single-stone self
captures are invalid since that would not change the position. In
graph terms that means no self-edges, regardless of the setting of
`allow_self_capture`.)

    go_game_graph(n::Integer; kwargs...)

Shortcut for `go_game_graph(go_board_graph(n); kwargs...)`.
"""
function go_game_graph(board_graph::SimpleGraph; allow_self_capture = true,
                       override_size_limit = false,
                       boards = nothing)
    if nv(board_graph) > 12 && !override_size_limit
        error("Board has more than 12 vertices, which will produce a very large game graph. If you are confident that your computer can handle that, add the keyword argument `override_size_limit=true`.")
    end
    board_edges = [outneighbors(board_graph, v) for v in vertices(board_graph)]
    game_graph = GameGraph(Board(board_edges),
                           allow_suicide = allow_self_capture)
    forward_adjacency_list = game_graph.edges
    num_vertices = length(forward_adjacency_list)
    num_edges = sum(length.(forward_adjacency_list))
    backward_adjacency_list = [Int[] for v in 1:num_vertices]
    for v = 1:num_vertices
        for w in forward_adjacency_list[v]
            push!(backward_adjacency_list[w], v)
        end
    end

    if boards isa Vector{Vector{Int}}
        append!(boards, game_graph.board)
    end

    return SimpleDiGraph(num_edges, forward_adjacency_list,
                         backward_adjacency_list)
end

go_game_graph(n::Integer; kwargs...) = go_game_graph(go_board_graph(n); kwargs...)


# --------- Board code --------------------------------
"""
    Board(id::Integer)

Generate a representation of a go board graph with the given `id`.
The number of nodes is the smallest `n` such that `2^(n*(n-1)/2)>id`.
The edges are found in the following way:
 * Enumerate all potential edges in the order `(1,2), (1,3), ..., (1,n), (2,3), (2,4), ..., (2,n), ..., (n,n)`.
 * Convert `id` to binary with `n*(n-1)/2` digits.
 * The edges in the list matching ones in the binary sequence are included in the graph.
Note: Many of these graphs will be isomorphic. Boards with 2 to 12
nodes are supported (corresponding to `1 <= id < 2^66`).

    Board(edges::Vector{Vector{Int}})

Construct a board graph from a specified list of outgoing edges from
each node. Note, if this does not describe an undirected graph, things
will go bad if it is used to construct a game graph.
"""
mutable struct Board
    edges::Vector{Vector{Int}}
    board::Vector{Int}
end

function num_nodes(id::Integer)
    for n = 1:16
        if Int128(1) << (n * (n - 1) ÷ 2) > id
            return n
        end
    end
    error("id $(id) out of range")
end

function Board(id::Integer)
    id < 1 && error("id must be at least 1.")
    n = num_nodes(id)
    # The code does work with more nodes but the memory requirements
    # start to become cumbersome. Relax this constraint at your own
    # risk.
    n > 12 && error("Board graphs with more than 12 nodes are not supported.")
    @assert(1 <= id < (Int128(1) << (n * (n - 1) ÷ 2)))
    edges = Vector{Int}[Int[] for k = 1:n]
    pairs = collect([i, j] for j = 1:n, i = 1:n if i < j)
    for p in reverse(pairs)
        if (id & 1) == 1
            i, j = p
            push!(edges[i], j)
            push!(edges[j], i)
        end
        id >>= 1
    end
    foreach(reverse!, edges)

    return Board(edges, zeros(Int, length(edges)))
end

Board(edges::Vector{Vector{Int}}) = Board(edges, zeros(Int, length(edges)))

function Base.show(io::IO, board::Board)
    print(io, "Board with $(length(board.edges)) nodes and $(sum(length.(board.edges)) ÷ 2) edges")
end

function clear!(board::Board)
    fill!(board.board, 0)
end

function mark_string_and_find_liberty!(board::Board, node, color)
    board.board[node] |= 4
    for neighbor in board.edges[node]
        if board.board[neighbor] == 0
            return true
        elseif board.board[neighbor] == color
            if mark_string_and_find_liberty!(board, neighbor, color)
                return true
            end
        end
    end

    return false
end

function remove_mark!(board::Board)
    for i = 1:length(board.board)
        board.board[i] &= 3
    end
end

function remove_marked_string!(board::Board)
    for i = 1:length(board.board)
        if board.board[i] & 4 != 0
            board.board[i] = 0
        end
    end
end

# Play a stone on the board. Remove neighbor stones without liberties.
# Remove itself and connected stones if they end up without liberties.
# Return whether the move was a suicide.
function play!(board::Board, node, color)
    board.board[node] = color
    for neighbor in board.edges[node]
        if board.board[neighbor] == 3 - color
            if mark_string_and_find_liberty!(board, neighbor, 3 - color)
                remove_mark!(board)
            else
                remove_marked_string!(board)
            end
        end
    end
    if mark_string_and_find_liberty!(board, node, color)
        remove_mark!(board)
    else
        remove_marked_string!(board)
        return true
    end

    return false
end

# Encode the board in base 3.
ternary_encode(board::Board) = 1 + dot(board.board, 3 .^ (length(board.board)-1:-1:0))

# Set up stones on a board to match a base 3 encoding. This is done by
# playing the stones one by one, starting from the empty board. If and
# only if the position is illegal some stones will be captured or
# suicided in the process, and the obtained position will not match
# the requested base 3 encoding. In that case return false.
function setup_position!(board::Board, pos::Int)
    clear!(board)
    x = string(pos - 1, base = 3, pad = length(board.board))
    for i = 1:length(board.board)
        c = parse(Int, x[i])
        if c > 0
            play!(board, i, c)
        end
    end
    return ternary_encode(board) == pos
end

# Try to make a move on a board and return the base 3 encoding of the
# obtained position. Undo the move before returning.
function trymove(board::Board, j::Int, allow_suicide = true)
    c = 1 + (j - 1) ÷ length(board.board)
    i = mod1(j, length(board.board))
    if board.board[i] != 0
        return 0
    end
    b = copy(board.board)
    is_suicide = play!(board, i, c)
    if !allow_suicide && is_suicide
        pos = 0
    else
        pos = ternary_encode(board)
    end
    board.board = b
    return pos
end

"""
    GameGraph(board::Board)

Compute a representation of the graph of positions for `board`.

    GameGraph(board::Board, allow_suicide = false)

Compute a representation of the graph of positions for `board` with no suicide moves.
"""
mutable struct GameGraph
    edges::Vector{Vector{Int}}
    board::Vector{Vector{Int}}
end

# B is the transition matrix indexed by move number. Illegal moves are
# represented by 0 entries.
# edges splits the B columns into a vector of vectors, and removes the
# 0 entries from each vector.
function GameGraph(board::Board; allow_suicide = true)
    N = length(board.edges)
    B = zeros(Int, 2 * N, 3^N)
    boards = fill(Int[], 3^N)
    for j = 1:3^N
        if setup_position!(board, j)
            boards[j] = copy(board.board)
            for i = 1:2*N
                B[i,j] = trymove(board, i, allow_suicide)
                # Filter out single stone suicides to get rid of
                # self-loops in the graph representation.
                if B[i,j] == j
                    B[i,j] = 0
                end
            end
        end
    end

    B, boards = compress_board_graph(B, boards)
    edges = [sort(vec(filter(x -> x > 0, B[:,k]))) for k = 1:size(B, 2)]

    return GameGraph(edges, boards)
end

function Base.show(io::IO, graph::GameGraph)
    num_nodes = length(graph.edges)
    num_edges = sum(length.(graph.edges))
    print("Game graph with $(num_nodes) nodes and $(num_edges) edges.")
end

# Remove illegal positions. Illegal positions are detected by not
# having any successors in the B matrix since they have never been
# reached. However, on the 1x1 board (and other boards whose graphs
# have no edges) the empty position only have self-suicides and thus
# no successors, breaking the assumption that only illegal positions
# lack successors in B. We handle this by assuming that first column
# in B corresponds to the empty board and never remove it.
function compress_board_graph(B::Matrix{Int}, boards::Vector{Vector{Int}})
    Bsum = vec(sum(B, dims = 1))
    Bsum[1] = 1
    I = findall(Bsum .!= 0)
    J = zeros(Int, size(B, 2))
    J[I] = 1:length(I)
    C = B[:,I]
    C[C.>0] = J[C[C.>0]]
    return C, boards[I]
end

"""
    export_graph(filename, graph::GameGraph)
    export_graph(filename, edges::Vector{Vector{Int}})

Export a graph to file. Format is simplest possible. On line `n` is
listed the outgoing edges from node `n`, separated by spaces.
"""
function export_graph(filename::String, edges::Vector{Vector{Int}})
    f = open(filename, "w")
    for e in edges
        println(f, join(string.(e), " "))
    end
    close(f)
end

function export_graph(filename::String, graph::GameGraph)
    export_graph(filename, graph.edges)
end

"""
    unique_graphs(n)

Identify the set of unique undirected graphs on `N` unlabeled vertices.
"""
function unique_graphs(n)
    n > 8 && error("You probably don't have enough memory to use this function for n > 8.")
    m = n * (n - 1) ÷ 2
    @assert(m <= 62)
    M = 1 << m
    isomorphisms = fill(-1, M)
    a = 1 .<< ((m-1):-1:0)
    for k = 1:M
        if isomorphisms[k] >= 0
            continue
        end
        x = map(x->parse(Int, x),
                split(string(k - 1, base = 2, pad = m), ""))
        mask = .!triu(trues(n, n))
        C = zeros(Int, n, n)
        C[mask] = x
        C += C'
        id = Int[]
        for p in permutations(1:n)
            i = dot(C[p,p][mask], a)
            push!(id, i)
        end
        isomorphisms[id .+ 1] .= minimum(id)
    end
    return unique(isomorphisms)
end

"""
    smallest_isomorphic_id(board::Board)

Find smallest id generating a board graph isomorphic to `board`.
"""
function smallest_isomorphic_id(board::Board)
    N = length(board.edges)
    m = N * (N - 1) ÷ 2
    a = [Int128(1) << x for x in ((m-1):-1:0)]
    C = zeros(Int, N, N)
    for i = 1:N
        for j in board.edges[i]
            C[i,j] = C[j,i] = 1
        end
    end
    mask = .!triu(trues(N, N))
    id = typemax(Int128)
    for p in permutations(1:N)
        i = dot(C[p,p][mask], a)
        id = min(id, i)
    end
    return id
end

"""
    is_board_graph_connected(id, N)

Determine whether the board graph with the given `id` is connected on
`N` nodes.

    is_board_graph_connected(id)

Like above when `N` is the smallest number of nodes that can represent
the board graph `id`, i.e. with no isolated nodes.
"""
function is_board_graph_connected(id, N = num_nodes(id))
    m = N * (N - 1) ÷ 2
    x = map(x->parse(Int, x), split(string(id, base = 2, pad = m), ""))
    mask = .!triu(trues(N, N))
    C = zeros(Int, N, N)
    C[mask] = x
    C += C'
    C += I
    return all(C^(N-1) .> 0)
end

"""
    remap(source_board::Board, target_board::Board)

Compute a remapping of the vertices of the Game Graph generated from
`source_board` to the Game Graph generated from `target_board`.
`source_board` and `target_board` must be isomorphic.

    remap(board::Board)

Like above where `target_board` is the `Board` with smallest id that
is isomorphic to `source_board`.
"""
function remap(source_board::Board,
               target_board::Board = Board(smallest_isomorphic_id(source_board)))
    if length(source_board.edges) != length(target_board.edges)
        error("source_board and target_board are not isomorphic")
    end
    N = length(source_board.edges)
    m = N * (N - 1) ÷ 2
    a = [Int128(1) << x for x in ((m-1):-1:0)]
    C_source = zeros(Int, N, N)
    C_target = zeros(Int, N, N)
    for i = 1:N
        for j in source_board.edges[i]
            C_source[i,j] = C_source[j,i] = 1
        end
        for j in target_board.edges[i]
            C_target[i,j] = C_target[j,i] = 1
        end
    end
    permutation = Int[]
    for p in permutations(1:N)
        if C_source[p, p] == C_target
            permutation = p
            break
        end
    end
    if isempty(permutation)
        error("source_board and target_board are not isomorphic")
    end

    B = Int[]
    for i = 1:3^N
        if setup_position!(source_board, i)
            j = 1 + parse(Int,
                          string(i - 1, base = 3, pad = N)[permutation],
                          base = 3)
            push!(B, j)
        end
    end

    BB = sort(B)
    M = Int[]
    for i = 1:length(B)
        push!(M, findall(BB .== B[i])[1])
    end

    return M
end

# [Heap's algorithm](https://en.wikipedia.org/wiki/Heap%27s_algorithm)
# implemented as an iterator of sorts.
#
# Important: This is reusing and mutating the returned permutation in
# every step. As a consequence `collect` will return n! copies of the
# same vector and would need to be replaced by
#     [copy(p) for p in permutations(x)]
#
# TODO: Reimplement this in a way which is a little more true to the
# iteration protocol. The mutating property is important to make this
# allocation-free though.
#
# TODO: Find out why `iterate` is making one allocation per call. It
# looks like it's coming from the return of a tuple. Check if this
# disappears on newer Julia than 1.10.
#
# Note: `Combinatorics.permutations` allocates a lot and we don't need
# the permutations to be sorted in any particular way.
mutable struct Permutations
    A::Vector{Int}
    c::Vector{Int}
    i::Int
end

permutations(A) = Permutations(collect(A), fill(1, length(A)), 1)

Base.length(h::Permutations) = prod(1:length(h.A))

function Base.iterate(permutations::Permutations, state = nothing)
    (; A, c, i) = permutations
    if i == 1
        permutations.i = 2
        return A, nothing
    end
    n = length(c)
    while c[i] >= i
        c[i] = 1
        i += 1
        i > n && return nothing
    end
    if isodd(i)
        A[1], A[i] = A[i], A[1]
    else
        A[c[i]], A[i] = A[i], A[c[i]]
    end
    c[i] += 1
    i = 2
    permutations.i = i
    return A, nothing
end

end
