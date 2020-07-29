require_relative 'board.rb'

class StartGame
  attr_accessor :board
  attr_reader :player_one, :player_two
  def initialize
    @board = Board.new
    @player_one = "X"
    @player_two = "O"
    main_menu
  end

  def main_menu
    puts "Welcome To Connect Four!
        Press 'P' To Start
                Or
        Press 'Q' To Quit"
    input = gets.chomp.downcase
    if input == "p"
      player_one_turn
    elsif input != "p"
      abort "See you next time!"
    end
  end

  def player_one_turn
    puts "Player One's Turn! Please choose a colum: "
    @board.display_board
    colum = gets.chomp.to_i
    if @board.valid_colum?(colum) && !@board.colum_full?(colum)
      place_piece(colum, @player_one)
    else
      system "clear"
      puts "Colum is full or invalid!"
      player_one_turn
    end
    system "clear"
  end

  def player_two_turn
    puts "Player Two's Turn! Please choose a colum: "
    @board.display_board
    colum = gets.chomp.to_i
    if @board.valid_colum?(colum) && !@board.colum_full?(colum)
      place_piece(colum, @player_two)
    else
      system "clear"
      puts "Colum is full or invalid!"
      player_two_turn
    end
    system "clear"
  end

  def place_piece(colum, player)
    row = @board.piece_row_placement(colum)
    @board.board[colum-1][row] = player
    return win if @board.vertical_win?(player, colum)
    return win if @board.horizontal_win?(player, row)
    return win if @board.diagonal_win?(player, colum, row)
    return tie if @board.tie?
    system("clear")
    player_change(player)
  end

  def player_change(player)
    if player == "X"
      player_two_turn
    elsif player == "O"
      player_one_turn
    end
  end

  def tie
    system "clear"
    @board.display_board
    abort "You Both Have Tied, Try Again To See Who Wins!"
  end

  def win
    system "clear"
    @board.display_board
    abort "Congratulations On Winning, See You Next Time!"
  end
end
