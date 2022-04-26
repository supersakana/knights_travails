# frozen_string_literal: true

# node contains a value(coordinate) and adjacent cells
class Cell
  attr_accessor :value, :moves, :level, :predecessor

  def initialize(value)
    @value = value
    @moves = []
    @level = nil
    @predecessor = nil
  end
end
