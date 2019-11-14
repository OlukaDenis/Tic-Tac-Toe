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

  it 'check for the empty method' do
    mboard = Board.new
    test_one = mboard.check_for_winner
    result = [false, nil]
    expect(test_one).to eq(result)
  end

  it 'check for the player X win using #check_for_win' do
    mboard = Board.new
    mboard.selection('X', '1')
    mboard.selection('X', '2')
    mboard.selection('X', '3')
    test_one = mboard.check_for_winner
    result = [true, 'X']
    expect(test_one).to eq(result)
  end

  it 'check for the player O win using #check_for_win' do
    mboard = Board.new
    mboard.selection('O', '4')
    mboard.selection('O', '5')
    mboard.selection('O', '6')
    test_one = mboard.check_for_winner
    result = [true, 'O']
    expect(test_one).to eq(result)
  end

  it 'valid? to return true when input is valid' do
    testing = Board.new
    testcase = 1
    while testcase < 10
      expect(testing.valid?(testcase.to_s)).to be_truthy
      testcase += 1
    end
  end

  it 'valid? to return false when input is invalid' do
    testing = Board.new
    testcase = 1
    while testcase < 10
      testing.selection('X', testcase.to_s)
      expect(testing.valid?(testcase.to_s)).to be_falsy
      testcase += 1
    end
  end

  describe '#convert_to_index' do
    testing_board = Board.new
    it 'Convert number 1 to index [0,0]' do
      test_one = testing_board.convert_to_index('1')
      expect(test_one).to eq([0, 0])
    end

    it 'Convert number 2 to index [0,1]' do
      test_two = testing_board.convert_to_index('2')
      expect(test_two).to eq([0, 1])
    end

    it 'Convert number 3 to index [0,2]' do
      test_two = testing_board.convert_to_index('3')
      expect(test_two).to eq([0, 2])
    end

    it 'Convert number 4 to index [1,0]' do
      test_two = testing_board.convert_to_index('4')
      expect(test_two).to eq([1, 0])
    end

    it 'Convert number 5 to index [1,1]' do
      test_two = testing_board.convert_to_index('5')
      expect(test_two).to eq([1, 1])
    end

    it 'Convert number 6 to index [1,2]' do
      test_two = testing_board.convert_to_index('6')
      expect(test_two).to eq([1, 2])
    end

    it 'Convert number 7 to index [2,0]' do
      test_two = testing_board.convert_to_index('7')
      expect(test_two).to eq([2, 0])
    end

    it 'Convert number 8 to index [2,1]' do
      test_two = testing_board.convert_to_index('8')
      expect(test_two).to eq([2, 1])
    end

    it 'Convert number 9 to index [2,0]' do
      test_two = testing_board.convert_to_index('9')
      expect(test_two).to eq([2, 2])
    end
  end
end
