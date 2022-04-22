# frozen_string_literal: true

require_relative 'cell'

# 8 x 8 cell game board
class Board
  def initialize
    @board = {}
  end

  def add_cell(cell)
    @board[cell.data] = cell
  end

  def add_edge(cell1, cell2)
    @board[cell1].add_edge(@board[cell2])
    @board[cell2].add_edge(@board[cell1])
  end
end
