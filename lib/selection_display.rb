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
end
