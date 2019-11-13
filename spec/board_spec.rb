# frozen_string_literal: true

require_relative '../lib/board'

RSpec.describe 'Board Values and Methods' do
  let(:board) { [%w[1 2 3], %w[4 5 6], %w[7 8 9]] }
  let(:turn) { 0 }
  let(:player_one_turn) { true }

  it 'Board initial board should be' do
    testing_board = Board.new
    expect(testing_board.board).to eq(board)
  end

  it 'Board initial turn' do
    testing_turn = Board.new
    expect(testing_turn.turn).to eq turn
  end

  it 'Initial player turn' do
    testing_player_turn = Board.new
    expect(testing_player_turn.player_one_turn).to eq(player_one_turn)
  end

  it 'selection array @board changes to contain the new value' do
    testing = Board.new
    testcase = 1
    while testcase < 10
      testing.selection('X', testcase.to_s)
      board_to_test = testing.board[0].concat(testing.board[1], testing.board[2])
      expect(board_to_test).to include('X')
      testcase += 1
    end
  end

  it 'selection array @board changes to NOT have the old value' do
    testing = Board.new
    testcase = 1
    while testcase < 10
      testing.selection('X', testcase.to_s)
      board_to_test = testing.board[0].concat(testing.board[1], testing.board[2])
      expect(board_to_test).not_to include(testcase.to_s)
      testcase += 1
    end
  end

  it 'valid? to return true when input is valid' do
    testing = Board.new
    testcase = 1
    while testcase < 10
      expect(testing.valid?(testcase.to_s)).to be_truthy
      testcase += 1
    end
  end

  it 'valid? to return false when input is valid' do
    testing = Board.new
    testcase = 1
    while testcase < 10
      testing.selection('X', testcase.to_s)
      expect(testing.valid?(testcase.to_s)).to be_falsy
      testcase += 1
    end
  end
end
