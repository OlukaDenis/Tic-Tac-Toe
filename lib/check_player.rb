# frozen_string_literal: true

def check_valid_player(player)
  if player.upcase == 'X'
    player.upcase == 'O'
    return true
  elsif player.upcase == 'O'
    player.upcase == 'X'
    return true
  end
  false
end
