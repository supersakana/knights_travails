# frozen_string_literal: true

# node contains a value(coordinate) and adjacent cells
class Cell
  attr_accessor :value, :moves, :predecessor

  def initialize(value)
    @value = value
    @moves = []
    @predecessor = nil
  end
end
