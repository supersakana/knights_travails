# frozen_string_literal: true

require_relative 'board'
def instructions
  puts <<~HEREDOC

    Welcome to Knights Travails!

    In an 8 x 8 Chess board, the Knight can move 2 steps forward, 1 step to either side.

    To run this program, type in a coordinate ([x, y]) for the starting position of the knight
    then another coordinate you want the knight to land on.

    You will be returned with a list of moves to make from your start to end point.

    (Click ENTER to start!)

  HEREDOC
end

instructions
gets
knights_travails = Board.new
knights_travails.start
