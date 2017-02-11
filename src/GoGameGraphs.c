#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define MAX_NODES 12
#define EMPTY 0

struct edges {
  int num_edges;
  int edges[MAX_NODES];
};

struct board {
  int num_nodes;
  struct edges edges[MAX_NODES];
  int board[MAX_NODES];
};

void
init_board(struct board *board, int num_nodes)
{
  board->num_nodes = num_nodes;
  for (int n = 0; n < num_nodes; n++)
    board->edges[n].num_edges = 0;
}

int
num_nodes(uint64_t id)
{
  for (int n = 1; n <= 11; n++) {
    if ((uint64_t) 1 << (n * (n - 1) / 2) > id)
      return n;
  }
  return 12;
}

void
add_edge(struct edges *edges, int target)
{
  edges->edges[edges->num_edges++] = target;
}

void
set_board_edges(struct board *board, uint64_t id)
{
  int n = num_nodes(id);
  init_board(board, n);
  for (int i = n - 1; i >= 0; i--) {
    for (int j = n - 1; j > i; j--) {
      if (id & 1) {
	add_edge(&board->edges[i], j);
	add_edge(&board->edges[j], i);
      }
      id >>= 1;
    }
  }
}

void
clear_board(struct board *board)
{
  for (int n = 0; n < board->num_nodes; n++)
    board->board[n] = EMPTY;
}

int
mark_string_and_find_liberty(struct board *board, int node, int color)
{
  board->board[node] |= 4;
  for (int n = 0; n < board->edges[node].num_edges; n++) {
    int neighbor = board->edges[node].edges[n];
    if (board->board[neighbor] == 0)
      return 1;
    if (board->board[neighbor] == color
	&& mark_string_and_find_liberty(board, neighbor, color))
      return 1;
  }

  return 0;
}

void
remove_mark(struct board *board)
{
  for (int n = 0; n < board->num_nodes; n++)
    board->board[n] &= 3;
}

void
remove_marked_string(struct board *board)
{
  for (int n = 0; n < board->num_nodes; n++)
    if (board->board[n] & 4)
      board->board[n] = 0;
}

/* Play a stone on the board. Remove neighbor stones without liberties.
 * Remove itself and connected stones if they end up without liberties.
 */
void
play(struct board *board, int node, int color)
{
  board->board[node] = color;
  for (int n = 0; n < board->edges[node].num_edges; n++) {
    int neighbor = board->edges[node].edges[n];
    if (board->board[neighbor] == 3 - color) {
      if (mark_string_and_find_liberty(board, neighbor, 3 - color))
	remove_mark(board);
      else
	remove_marked_string(board);
    }
  }

  if (mark_string_and_find_liberty(board, node, color))
    remove_mark(board);
  else
    remove_marked_string(board);
}

/* Encode the board in base 3. */
int
ternary_encode(struct board *board)
{
  int code = 0;
  for (int n = 0; n < board->num_nodes; n++) {
    code *= 3;
    code += board->board[n];
  }
  return code;
}

/* Set up stones on a board to match a base 3 encoding. This is done by
 * playing the stones one by one, starting from the empty board. If and
 * only if the position is illegal some stones will be captured or
 * suicided in the process, and the obtained position will not match
 * the requested base 3 encoding. In that case return false.
 */
int
setup_position(struct board *board, int pos)
{
  int p = pos;
  clear_board(board);

  for (int n = board->num_nodes - 1; n >= 0; n--) {
    int c = p % 3;
    p /= 3;
    if (c > 0)
      play(board, n, c);
  }

  return ternary_encode(board) == pos;
}

/* Try to make a move on a board and return the base 3 encoding of the
 * obtained position. Undo the move before returning.
 */
int
trymove(struct board *board, int j)
{
  int c = 1 + j / board->num_nodes;
  int n = j % board->num_nodes;
  if (board->board[n])
    return -1;

  int board_copy[MAX_NODES];
  memcpy(board_copy, board->board, sizeof(board_copy));
  play(board, n, c);
  int pos = ternary_encode(board);
  memcpy(board->board, board_copy, sizeof(board_copy));

  return pos;
}

/* Just normal ordering of integers for use by qsort. */
int
lessthan(const void *x, const void *y)
{
  return *((int *) x) - *((int *) y);
}

void
compute_game_graph(struct board *board, FILE *out)
{
  int N = 1;
  for (int n = 0; n < board->num_nodes; n++)
    N *= 3;

  int *position_numbers = malloc(N * sizeof(*position_numbers));
  if (!position_numbers) {
    fprintf(stderr, "Failed to allocate memory.");
    exit(EXIT_FAILURE);
  }

  int position_counter = 0;
  for (int n = 0; n < N; n++) {
    if (setup_position(board, n))
      position_numbers[n] = position_counter++;
    else
      position_numbers[n] = -1;
  }

  int num_outgoing_edges;
  int outgoing_edges[2 * MAX_NODES];
  for (int n = 0; n < N; n++) {
    if (position_numbers[n] >= 0) {
      setup_position(board, n);
      num_outgoing_edges = 0;
      for (int i = 0; i < 2 * board->num_nodes; i++) {
	int target = trymove(board, i);
	/* Filter out single stone suicides to get rid of
	 * self-loops in the graph representation.
	 */
	if (target != n && target != -1)
	  outgoing_edges[num_outgoing_edges++] = position_numbers[target];
      }
      qsort(outgoing_edges, num_outgoing_edges, sizeof(*outgoing_edges),
	    lessthan);

      /* Print the outgoing edges from this node. */
      for (int i = 0; i < num_outgoing_edges; i++) {
	fprintf(out, "%d", 1 + outgoing_edges[i]);
	if (i < num_outgoing_edges - 1)
	  fprintf(out, " ");
      }
      fprintf(out, "\n");
    }
  }

  free(position_numbers);
}

int
main(int argc, char **argv)
{
  FILE *out = stdout;
  if (argc < 2 || argc > 3) {
    fprintf(stderr, "Usage: %s id [filename]\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  uint64_t id = strtoull(argv[1], (char **) 0, 10);
  struct board board;
  set_board_edges(&board, id);

  if (argc > 2) {
    out = fopen(argv[2], "w");
    if (!out) {
      fprintf(stderr, "Failed to open output file for writing.\n");
      exit(EXIT_FAILURE);
    }
  }

  compute_game_graph(&board, out);

  if (argc > 2)
    fclose(out);

  exit(EXIT_SUCCESS);
}
