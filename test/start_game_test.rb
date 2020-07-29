require "test_helper.rb"
require_relative "../lib/start_game.rb"


describe StartGame do
  let(:game) {StartGame.new}

  it "should exsit" do
    expect(game).to be_kind_of(StartGame)
  end

  it "should return player one and two" do
    expect(game.player_one).to eq("X")
    expect(game.player_two).to eq("O")
  end

  xit "should return true if the colum is valid for playe one" do
    game.board.board[1][0] = "X"
    game.player_one_turn

    expect(game.board.board[2][5]).to eq("X")
  end

  xit "should return true if the colum is valid for player two" do
    game.board.board[1][0] = "X"
    game.player_two_turn

    expect(game.board.board[2][5]).to eq("O")
  end

  xit "should return the player input on the board" do
    game.place_piece(2, "X")

    expect(game.board.board[1][5]).to eq("X")
  end

  xit "should end game when user enters valid input" do
    expect(game.main_menu).to eq(game.main_menu)
  end

  xit "should end game when user enters valid input" do
    expect(game.main_menu).to eq(game.player_one_turn)
  end

  xit "should win game if won vertically" do
    game.place_piece(1, "X")
    game.place_piece(1, "X")
    game.place_piece(1, "X")

    expect(game.place_piece(1, "X")).to eq(game.win)
  end

  xit "should win game if won horizontally" do
    game.place_piece(1, "X")
    game.place_piece(2, "X")
    game.place_piece(3, "X")

    expect(game.place_piece(4, "X")).to eq(game.win)
  end

  xit "should win game if won diagonally" do
    game.board.board[2][2] = "X"
    game.board.board[3][3] = "X"
    game.board.board[4][4] = "X"

    expect(game.place_piece(6, "X")).to eq(game.win)
  end

  it "should win game if won diagonally" do
    game.board.board[0][0] = "X"
    game.board.board[1][0] = "X"
    game.board.board[2][0] = "X"
    game.board.board[3][0] = "X"
    game.board.board[4][0] = "X"
    game.board.board[5][0] = "X"
    
    game.board.board[6][1] = "X"
    game.board.board[6][2] = "X"
    game.board.board[6][3] = "X"
    game.board.board[6][4] = "X"
    game.board.board[6][5] = "X"

    expect(game.place_piece(7, "X")).to eq(game.tie)
  end
end
