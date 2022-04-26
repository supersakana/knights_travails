# frozen_string_literal: true

require_relative 'cell'

# 8 x 8 game board
class Board
  def initialize
    @board = {}
  end

  # runs the program
  def start
    create_board
    add_edges
    p bfs([0, 0], [3, 3])
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

  #   adds a cell to board
  def add_cell(cell)
    @board[cell.value] = cell
  end

  #   assigns each cell with list of possible knight moves
  def add_edges
    @board.each do |k, v|
      add_moves(k, v)
      # p "#{k} ~ #{v}"
      # p "Knight Moves: #{v.moves}"
      # p '---------------------'
    end
  end

  #  creates each possible knight move for cell
  #  excludes any coordinates outside of the gameboard
  #  (TEMPORARY SOLUTION)
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

  # breadth first search
  def bfs(root, search)
    visited = []
    q = [@board[root]]

    until q.empty?
      current = q.shift
      visited << current.value
      return visited if current.value == search

      # add possible knight moves to queue for traversal if node not found
      current.moves.each do |move|
        q << @board[move] unless visited.include?(move)
      end
    end
  end
end
