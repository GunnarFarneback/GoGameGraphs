export go_board_graph, go_game_graph

# Can't use import or using here without getting a warning about
# missing dependencies. Instead we have to qualify everything used
# from LightGraphs. Let's make that more convenient with an alias.
const LG = LightGraphs

"""
    go_board_graph(n::Integer)

Construct an undirected graph according to the numbering scheme of the
GoGameGraphs package. The graph is returned as a `LightGraphs.SimpleGraph`.
"""
function go_board_graph(n::Integer)
    adjacency_list = Board(n).edges
    return LG.SimpleGraph(sum(length.(adjacency_list)) ÷ 2, adjacency_list)
end

"""
    go_game_graph(board_graph::LightGraphs.SimpleGraph)

Return the directed graph corresponding to playing the game of go on
the undirected graph `board_graph`. Although go is traditionally
played on a square grid, the rules can be applied to any undirected
graph. All the possible board positions act as vertices in the game
graph and the moves as edges. The empty board corresponds to vertex 1.
The result is a sparse directed and strongly connected graph with lots
of cycles. It is returned as a `LightGraphs.SimpleDiGraph`.

The size of the game graph grows exponentially with the number of
vertices in the corresponding board graph. This function supports
board graphs of up to 12 vertices. The size limit can be overridden
but you have been warned.

    go_game_graph(board_graph::LightGraphs.SimpleGraph; allow_self_capture = false)

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
"""
function go_game_graph(board_graph::LG.SimpleGraph; allow_self_capture = true,
                       override_size_limit = false,
                       boards = nothing)
    if LG.nv(board_graph) > 12 && !override_size_limit
        error("Board has more than 12 vertices, which will produce a very large game graph. If you are confident that your computer can handle that, add the keyword argument `override_size_limit=true`.")
    end
    board_edges = [LG.outneighbors(board_graph, v) for v in LG.vertices(board_graph)]
    game_graph = GameGraph(Board(board_edges),
                           allow_suicide = allow_self_capture)
    forward_adjacency_list = game_graph.edges
    nv = length(forward_adjacency_list)
    ne = sum(length.(forward_adjacency_list))
    backward_adjacency_list = [Int[] for v in 1:nv]
    for v = 1:nv
        for w in forward_adjacency_list[v]
            push!(backward_adjacency_list[w], v)
        end
    end

    if boards isa Vector{Vector{Int}}
        append!(boards, game_graph.board)
    end

    return LG.SimpleDiGraph(ne, forward_adjacency_list, backward_adjacency_list)
end
