# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize
    @board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  def check_for_winner(boardstate)
    current_b = boardstate[0] + boardstate[1] + boardstate[2]

    if current_b[0] == current_b[1] && current_b[1] == current_b[2]
      return [true, current_b[0]]
    elsif current_b[3] == current_b[4] && current_b[4] == current_b[5]
      return [true, current_b[3]]
    elsif current_b[6] == current_b[7] && current_b[7] == current_b[8]
      return [true, current_b[6]]

    elsif current_b[0] == current_b[3] && current_b[3] == current_b[6]
      return [true, current_b[0]]
    elsif current_b[1] == current_b[4] && current_b[4] == current_b[7]
      return [true, current_b[1]]
    elsif current_b[2] == current_b[5] && current_b[5] == current_b[8]
      return [true, current_b[2]]

    elsif current_b[0] == current_b[4] && current_b[4] == current_b[8]
      return [true, current_b[0]]
    elsif current_b[2] == current_b[4] && current_b[4] == current_b[6]
      return [true, current_b[2]]

    end

    return[false, nil]
  end
end

puts Board.new.check_for_winner([%w[X X X], %w[4 5 6], %w[7 8 9]])
