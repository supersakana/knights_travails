# frozen_string_literal: true

require_relative 'cell'

# 8 x 8 cell game board
class Board
  def initialize
    @board = {}
  end

  #   adds a cell to board
  def add_cell(cell)
    @board[cell.value] = cell
  end

  #   creates 64 cells for 8 x 8 board
  def create_board
    x = (0..7).to_a
    y = (0..7).to_a
    x.each do |x_val|
      y.each do |y_val|
        cell = Cell.new([x_val, y_val])
        add_cell(cell)
      end
    end
  end

  #   assigns each cell with adjecent cells
  def add_edges
    @board.each do |k, v|
      assign_adjacents(k, v)
      p "#{k} ~ #{v.adjacent_cells}"
    end
  end

  def assign_adjacents(k, v)
    v.adjacent_cells << [k[0] + 1, k[1]]  unless k[0] + 1 > 7
    v.adjacent_cells << [k[0], k[1] + 1]  unless k[1] + 1 > 7
    v.adjacent_cells << [k[0] - 1, k[1]]  unless (k[0] - 1).negative?
    v.adjacent_cells << [k[0], k[1] - 1]  unless (k[1] - 1).negative?
  end
end

# Questions

# "How can we assing each node with it's adjacent neighbor?"
# "How can we express a condition where the neightbors can NOT be > 7 || < 0?"
# "With this graph model, will we be able to implement a BFT?"
