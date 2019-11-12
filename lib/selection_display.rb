# frozen_string_literal: true

class Selector
  def selection(player, num, obj)
    obj.each do |n|
      next unless n.include? num

      n.map! do |ele|
        ele == num ? player : ele
      end
    end
  end

  def valid?(num, obj)
    selec_index = convert_to_index(num)
    col = []
    obj.each_with_index do |n, index|
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
