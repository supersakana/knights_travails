# frozen_string_literal: true

# Each cell has a pointer: (n = north, s = south, e = east, w = west)
# node also contains a coordinate
class Cell
  attr_accessor :data, :neighbors

  def initialize(value)
    @value = value
    @adjacent_cells = []
  end

  def add_edge(adjacent_cell)
    @adjacent_cells << adjacent_cell
  end
end
