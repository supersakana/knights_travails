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
  #   temporaraly prints each cell with moves
  def add_edges
    @board.each do |k, v|
      add_moves(k, v)
      p "#{k} ~ #{v.moves.map(&:value)}"
    end
  end

  #  creates each possible knight move for cell
  #  excludes any coordinates outside of the gameboard
  #  (TEMPORARY SOLUTION)
  def add_moves(k, v)
    # top right coordinates
    v.moves << @board[[k[0] + 2, k[1] + 1]]  unless k[0] + 2 > 7 || k[1] + 1 > 7
    v.moves << @board[[k[0] + 1, k[1] + 2]]  unless k[0] + 1 > 7 || k[1] + 2 > 7

    # top left coordinates
    v.moves << @board[[k[0] - 1, k[1] + 2]]  unless (k[0] - 1).negative? || k[1] + 2 > 7
    v.moves << @board[[k[0] - 2, k[1] + 1]]  unless (k[0] - 2).negative? || k[1] + 1 > 7

    # bottom right coordinates
    v.moves << @board[[k[0] + 1, k[1] - 2]]  unless k[0] + 1 > 7 || (k[1] - 2).negative?
    v.moves << @board[[k[0] + 2, k[1] - 1]]  unless k[0] + 2 > 7 || (k[1] - 1).negative?

    # bottom left coordinates
    v.moves << @board[[k[0] - 2, k[1] - 1]]  unless (k[0] - 2).negative? || (k[1] - 1).negative?
    v.moves << @board[[k[0] - 1, k[1] - 2]]  unless (k[0] - 1).negative? || (k[1] - 2).negative?
  end
end
