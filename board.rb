# frozen_string_literal: true

require_relative 'cell'

# 8 x 8 game board
class Board
  def initialize
    @board = {}
  end

  # runs the main program
  def start
    create_board
    add_edges

    knight_moves([7, 7], [0, 0])

    knight_moves([0, 0], [4, 5])

    knight_moves([1, 2], [0, 0])

    knight_moves([3, 3], [4, 3])
  end

  #   creates 64 cells for 8 x 8 board
  def create_board
    coordinates = (0..7).to_a
    coordinates.each do |x|
      coordinates.each do |y|
        cell = Cell.new([x, y])
        add_cell(cell)
      end
    end
  end

  #   adds a cell to @board
  def add_cell(cell)
    @board[cell.value] = cell
  end

  #   assigns each cell with list of possible knight moves
  def add_edges
    @board.each do |k, v|
      add_moves(k, v)
    end
  end

  #  creates possible knight move for a cell
  def add_moves(k, v)
    # top right coordinates
    v.moves << [k[0] + 2, k[1] + 1]  unless k[0] + 2 > 7 || k[1] + 1 > 7
    v.moves << [k[0] + 1, k[1] + 2]  unless k[0] + 1 > 7 || k[1] + 2 > 7

    # top left coordinates
    v.moves << [k[0] - 1, k[1] + 2]  unless (k[0] - 1).negative? || k[1] + 2 > 7
    v.moves << [k[0] - 2, k[1] + 1]  unless (k[0] - 2).negative? || k[1] + 1 > 7

    # bottom right coordinates
    v.moves << [k[0] + 1, k[1] - 2]  unless k[0] + 1 > 7 || (k[1] - 2).negative?
    v.moves << [k[0] + 2, k[1] - 1]  unless k[0] + 2 > 7 || (k[1] - 1).negative?

    # bottom left coordinates
    v.moves << [k[0] - 2, k[1] - 1]  unless (k[0] - 2).negative? || (k[1] - 1).negative?
    v.moves << [k[0] - 1, k[1] - 2]  unless (k[0] - 1).negative? || (k[1] - 2).negative?
  end

  # returns user with shortest path from a start to landing position
  def knight_moves(root, key)
    path = bfs(root, key)
    output = trim_path(path)

    puts "You made it in #{output.size - 1} move(s)! Here is your path:"
    p output
    puts ' '
    refresh_data
  end

  # breadth first search
  def bfs(root, key)
    visited = []
    q = [@board[root]]

    until q.empty?
      current = q.shift
      visited << current
      return visited if current.value == key

      # add possible knight moves to queue for traversal if node not found
      current.moves.each do |move|
        q << @board[move] unless visited.include?(move)
        @board[move].predecessor = current.value if @board[move].predecessor.nil? && move != root
      end
    end
  end

  # takes the path created from BFS and returns shortest path
  def trim_path(path)
    current = path[path.length - 1]
    new_path = [current.value]
    i = path.length - 2
    until i == -1
      if path[i].value == current.predecessor
        current = path[i]
        new_path.unshift(current.value)
      end
      i -= 1
    end
    new_path
  end

  # resets all cell predecessors
  def refresh_data
    @board.each do |_k, v|
      v.predecessor = nil
    end
  end
end
