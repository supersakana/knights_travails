# frozen_string_literal: true

require_relative 'board'
def instructions
  puts <<~HEREDOC

    Welcome to Knights Travails!

    In an 8 x 8 Chess board, the Knight can move 2 steps forward, 1 step to either side.

    This program will returned a list of moves from the defined start to the landing point.

    (Click ENTER to start!)

  HEREDOC
end

instructions
gets
knights_travails = Board.new
knights_travails.start
