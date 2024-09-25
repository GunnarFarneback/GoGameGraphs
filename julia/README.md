# GoGameGraphs

The game of Go is normally played on a 19x19 board, and sometimes on
smaller quadratic boards. However, the board mechanics naturally
generalize to arbitrary undirected graphs. The attainable positions in
a game can be considered as the nodes of a new graph, and the moves as
directed edges between the positions. This induced graph is called the
game graph.

Thus every undirected graph induces a Go Game Graph. This package is
dedicated to creating these graphs.

Go Game Graphs are sparse directed graphs with an abundance of cycles
and a small radius. They range from very small up to arbitrarily large
sizes and could be useful for testing various graph algorithms
applicable to this kind of graph.

More information can be found in the [main README of the
repository](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/README.md).

## Installation

```
using Pkg
Pkg.add(url = "https://github.com/GunnarFarneback/GoGameGraphs.git", subdir = "julia")
```

## Usage

The basic usage is to call `go_game_graph(id)` to create a
`SimpleDiGraph` from the `Graphs` package. E.g.
```
julia> using GoGameGraphs

julia> go_game_graph(12345)
{151, 626} directed simple Int64 graph
```

`id` is the id of the game graph and the graph size increases
asymptotically (but not monotonically) with `id`.

## Advanced Usage

    go_game_graph(board)

Generate a go game graph from an undirected graph from the `Graphs`
package. The game graph size grows exponentially with the board graph
size.

    go_game_graph(id, allow_self_capture = false)
    go_game_graph(board, allow_self_capture = false)

Generate a game graph with somewhat fewer edges than the default
call, corresponding to playing go without allowing multi-stone self
capture.

    go_board_graph(id)

Generate the undirected graph representing the board used to generate
the corresponding game graph. This returns a `SimpleGraph` from the
`Graphs` package.

    Board(id)
    GameGraph(Board(id))

Like `go_board_graph` and `go_game_graph` but returning an internal
representation which does not involve the `Graphs` package.

    export_graph(filename, graph)

Write the adjacency list representation of a `GameGraph` to file.

    unique_graphs(n)

Many of the board graphs and game graphs are isomorphic.
`unique_graphs(n)` returns a set of ids for non-isomorphic board
graphs and game graphs for boards with `n` vertices.

    smallest_isomorphic_id(id)
    smallest_isomorphic_id(board)

Return the smallest id generating a board or game graph isomorphic to
the provided `id` or `board`.

    is_board_graph_connected(id)
    is_board_graph_connected(id, N)

Determine whether the board graph with `N` vertices and given `id` is
connected. If `N` is omitted, consider the smallest board graph that
can represent `id` (i.e. without isolated vertices).

    remap(source_board, target_board)
    remap(board)
    remap(source_id, target_id)
    remap(source_id)

Compute a remapping of the vertices of the game graph generated from
`source_board` to the game graph generated from `target_board`.
`source_board` and `target_board` must be isomorphic and can be given
as `Board` or `id`. If the target is omitted, remap to the board with
the smallest isomorphic id.
