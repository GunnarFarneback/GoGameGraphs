using GoGameGraphs
using Test

for id in reduce(vcat, [[2^i-1, 2^i] for i in 1:62])
    @test GoGameGraphs.num_nodes(id) == length(Board(id).edges)
end

# This directory is within the repository but outside of the Julia
# package, so it won't be possible to find the files when running
# package tests other than from a repository clone.
if isdir(joinpath(@__DIR__, "../../graphs"))
    @testset "Stored graphs" begin
        let filename = tempname()
            for id in [1, 3, 7, 11, 12, 13, 15, 30, 31, 63]
                export_graph(filename, GameGraph(Board(id)))
                s = read(joinpath(@__DIR__, "../../graphs/graph$(id)"), String)
                @test s == read(filename, String)
            end
        end
    end
end

function is_path_valid(graph::GameGraph, path::Vector{Int})
    for i = 2:length(path)
        if path[i] ∉ graph.edges[path[i - 1]]
            return false
        end
    end
    return true
end

sample_paths_dir = joinpath(@__DIR__, "sample_longest_paths")
function read_sample_path(filename)
    path_string = read(joinpath(sample_paths_dir, filename), String)
    path = [parse(Int, n) for n in split(path_string, "\n", keepempty = false)]
    return path
end

@testset "Sample longest paths" begin
    for filename in readdir(sample_paths_dir)
        path = read_sample_path(filename)
        graph = GameGraph(Board(parse(Int, replace(filename, "path" => ""))))
        @test is_path_valid(graph, path)
    end
end

@testset "Number of unique graphs" begin
    for (num_nodes, num_unique_graphs) in [(2, 2),
                                           (3, 4),
                                           (4, 11),
                                           (5, 34),
                                           (6, 156),
                                           (7, 1044)]
        @test length(unique_graphs(num_nodes)) == num_unique_graphs
    end
end

@testset "Isomorphic graphs" begin
    for id1 = 1:500:100000
        board1 = Board(id1)
        graph1 = GameGraph(board1)
        id2 = smallest_isomorphic_id(board1)
        graph2 = GameGraph(Board(id2))
        @test length(graph1.edges) == length(graph2.edges)
        @test sum(length.(graph1.edges)) == sum(length.(graph2.edges))
        N = length(board1.edges)
        @test is_board_graph_connected(id1, N) == is_board_graph_connected(id2, N)
    end
end

@testset "Remap between isomorphic graphs" begin
    source_board = Board(3448)
    source_path = read_sample_path("path3448")
    target_board = Board([[2,4],[1,3,5],[2,6],[1,5],[2,4,6],[3,5]])
    @test smallest_isomorphic_id(target_board) == 3448
    M = remap(source_board, target_board)
    target_path = M[source_path]
    @test is_path_valid(GameGraph(target_board), target_path)
end
