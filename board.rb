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

  #   adds link (edge) between two cells
  def add_edge(cell1, cell2)
    @board[cell1].add_edge(@board[cell2])
    @board[cell2].add_edge(@board[cell1])
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

  #   assigns each cell with adjecent cells (tbc...)
  def create_neighbors
    @board.each do |k, v|
      #   v.adjacent_cells << [k[0] + 1, k[1]]
      #   v.adjacent_cells << [k[0], k[1] + 1]
      #   v.adjacent_cells << [k[0] - 1, k[1]]
      #   v.adjacent_cells << [k[0], k[1] - 1]
      p "#{k} - #{v.adjacent_cells}"
    end
  end
end

# Questions

# "How can we assing each node with it's adjacent neighbor?"
# "How can we express a condition where the neightbors can NOT be > 7 || < 0?"
# "With this graph model, will we be able to implement a BFT?"
