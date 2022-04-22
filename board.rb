# frozen_string_literal: true

require_relative 'cell'

# 8 x 8 cell game board
class Board
  def initialize
    @board = {}
  end

  def add_cell(cell)
    @board[cell.value] = cell
  end

  def add_edge(cell1, cell2)
    @board[cell1].add_edge(@board[cell2])
    @board[cell2].add_edge(@board[cell1])
  end

  def create_board
    x = (0..7).to_a
    y = (0..7).to_a
    x.each do |x_val|
      y.each do |y_val|
        node = Cell.new([x_val, y_val])
        add_cell(node)
      end
    end
  end

  def create_neighbors
    @board.each do |k, v|
      p "#{k} - #{v.adjacent_cells}"
    end
  end
end
