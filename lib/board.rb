# frozen_string_literal: true

class Board
  attr_accessor :board
  attr_reader :turn
  attr_reader :player_one_turn

  def initialize
    @board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @turn = 0
    @player_one_turn = true
  end

  def check_for_winner(boardstate)
    current_b = boardstate[0] + boardstate[1] + boardstate[2]

    return [true, current_b[0]] if current_b[0] == current_b[1] && current_b[1] == current_b[2]
    return [true, current_b[3]] if current_b[3] == current_b[4] && current_b[4] == current_b[5]
    return [true, current_b[6]] if current_b[6] == current_b[7] && current_b[7] == current_b[8]
    return [true, current_b[0]] if current_b[0] == current_b[3] && current_b[3] == current_b[6]
    return [true, current_b[1]] if current_b[1] == current_b[4] && current_b[4] == current_b[7]
    return [true, current_b[2]] if current_b[2] == current_b[5] && current_b[5] == current_b[8]
    return [true, current_b[0]] if current_b[0] == current_b[4] && current_b[4] == current_b[8]
    return [true, current_b[2]] if current_b[2] == current_b[4] && current_b[4] == current_b[6]
    return [true, current_b[0]] if current_b[0] == current_b[1] && current_b[1] == current_b[2]

    [false, nil]
  end

  def add_turn
    @turn += 1
  end

  def end_game
    @turn = 10
  end

  def switch_player
    @player_one_turn = !@player_one_turn
  end
end
