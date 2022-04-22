# frozen_string_literal: true

require_relative 'cell'

# 8 x 8 cell game board
class Board
  def initialize
    @board = create_board
  end

  def create_board(x = 0, y = 0)
    return @cells if x == 8

    cell = Cell.new(x, y)
    p cell.data
    @cells.push(cell.data)
    create_board(x + 1, y + 1)
  end

  def print_board
    p @board
  end
end
