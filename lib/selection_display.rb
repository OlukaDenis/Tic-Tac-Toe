# frozen_string_literal: true

class Selector
  def selection(_player, num, ob)
    ob.to_i
    ob.each do |n|
      n = num if n == num
    end
    ob
  end
end
