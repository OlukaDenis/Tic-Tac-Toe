# frozen_string_literal: true

class Board
  attr_reader :board
  attr_reader :turn
  attr_reader :player_one_turn

  def initialize
    @board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @turn = 0
    @player_one_turn = true
  end

  def selection(player, num)
    @board.each do |n|
      next unless n.include? num

      n.map! do |ele|
        ele == num ? player : ele
      end
    end
  end

  def check_for_winner(_board_elem)
    current_b = @board[0] + @board[1] + @board[2]

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

  def valid?(num)
    selec_index = convert_to_index(num)
    col = []
    @board.each_with_index do |n, index|
      col = n if index == selec_index[0]
    end

    if col.include_any?(%w[X O])

      col.each_with_index do |x, i|
        return false if x == 'X' && i == selec_index[1] || x == 'O' && i == selec_index[1]
      end
    end
    true
  end

  def convert_to_index(num)
    return [0, 0] if num == '1'
    return [0, 1] if num == '2'
    return [0, 2] if num == '3'
    return [1, 0] if num == '4'
    return [1, 1] if num == '5'
    return [1, 2] if num == '6'
    return [2, 0] if num == '7'
    return [2, 1] if num == '8'
    return [2, 2] if num == '9'
  end
end

module Enumerable
  def include_any?(array)
    array.any? { |i| include? i }
  end
end
