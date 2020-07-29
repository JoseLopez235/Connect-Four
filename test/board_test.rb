require "test_helper.rb"
require_relative "../lib/board.rb"


describe Board do
  let(:board) {Board.new}

  it "should exsit" do
    expect(board).to be_kind_of(Board)
  end

  it "Should crate a nested array with 7 arrays" do
    expect(board.board.size).to eq(7)
  end

  xit "Should display the board" do
    expect(board.display_board).to eq(nil)
  end

  it "should return true if the column selected is true" do
    board.board[0][0] = "X"

    expect(board.colum_full?(1)).to eq(true)
    expect(board.colum_full?(4)).to eq(false)
  end

  it "should return true or false depending on player input" do
    expect(board.valid_colum?(4)).to eq(true)
    expect(board.valid_colum?(9)).to eq(false)
  end

  it "should return the last empty row in the column" do
    board.board[1][5] = "X"

    expect(board.piece_row_placement(2)).to eq(4)
    expect(board.piece_row_placement(1)).to eq(5)
  end

  it "should return true if the player won vertically" do
    board.board[1][board.piece_row_placement(2)] = "X"
    board.board[1][board.piece_row_placement(2)] = "X"
    board.board[1][board.piece_row_placement(2)] = "X"
    board.board[1][board.piece_row_placement(2)] = "X"

    expect(board.vertical_win?("X", 2)).to eq(true)
    expect(board.vertical_win?("X", 1)).to eq(false)
  end

  it "should return true if the player has a horizontal win" do
    board.board[0][5] = "X"
    board.board[1][5] = "X"
    board.board[2][5] = "X"
    board.board[3][5] = "X"
    board.board[0][4] = "X"

    expect(board.horizontal_win?("X", 5)).to eq(true)
    expect(board.horizontal_win?("X", 4)).to eq(false)
  end

  it "should return true if the game is a tie" do
    board.board[0][0] = "X"
    board.board[1][0] = "X"
    board.board[2][0] = "X"
    board.board[3][0] = "X"
    board.board[4][0] = "X"
    board.board[5][0] = "X"
    board.board[6][0] = "X"

    expect(board.tie?).to eq(true)
  end

  it "should return true if the player has a diagonal win false if not" do
    board.board[1][4] = "X"
    board.board[2][3] = "X"
    board.board[3][2] = "X"
    board.board[4][1] = "X"

    board.board[4][5] = "X"
    board.board[3][4] = "X"
    board.board[1][2] = "O"

    expect(board.diagonal_win?("X", 2, 4)).to eq(true)
    expect(board.diagonal_win?("X", 3, 3)).to eq(true)
    expect(board.diagonal_win?("X", 4, 4)).to eq(false)
  end

  it "should return the amount of X or O going up/right from the starting point" do
    board.board[1][4] = "X"
    board.board[2][3] = "X"
    board.board[3][2] = "X"
    board.board[4][1] = "X"

    expect(board.diagonal_up_right("X", 2, 3)).to eq(3)
  end

  it "should return the amount of X or O going down/left from the starting point(not counting the starting point)" do
    board.board[1][4] = "X"
    board.board[2][3] = "X"
    board.board[3][2] = "X"
    board.board[4][1] = "X"

    expect(board.diagonal_down_left("X", 2, 3)).to eq(1)
  end

  it "should return the amount of X or O going up/left from the starting point" do
    board.board[4][5] = "X"
    board.board[3][4] = "X"
    board.board[2][3] = "X"
    board.board[1][2] = "X"

    expect(board.diagonal_up_left("X", 2, 3)).to eq(2)
  end

  it "should return the amount of X or O going down/right from the starting point(not counting the starting point)" do
    board.board[4][5] = "X"
    board.board[3][4] = "X"
    board.board[2][3] = "X"
    board.board[1][2] = "X"

    expect(board.diagonal_down_right("X", 2, 3)).to eq(2)
  end
end
