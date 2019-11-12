# frozen_string_literal: true

class Selector
  def selection(_player, num, ob)
    ob.each do |n|
      next unless n.include? num

      n.map! do |ele|
        ele == num ? _player : ele
      end
    end
  end

  def is_valid?(num, ob)
    $selecIndex = convert_to_index(num)

    ob.each_with_index do |n, index|
      $col = n if index == $selecIndex[0]
    end

    if $col.include_any?(%w[X O])

      $col.each_with_index do |x, i|
        if x == 'X' && i == $selecIndex[1]
          return false

        elsif x == 'O' && i == $selecIndex[1]
          return false
        end
      end
    end
    true
  end

  def convert_to_index(num)
    if num == '1'
      [0, 0]
    elsif num == '2'
      [0, 1]
    elsif num == '3'
      [0, 2]
    elsif num == '4'
      [1, 0]
    elsif num == '5'
      [1, 1]
    elsif num == '6'
      [1, 2]
    elsif num == '7'
      [2, 0]
    elsif num == '8'
      [2, 1]
    elsif num == '9'
      [2, 2]
    end
  end
end

module Enumerable
  def include_any?(array)
    array.any? { |i| include? i }
  end
end
