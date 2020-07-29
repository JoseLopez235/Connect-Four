class Board
  attr_reader :board
  def initialize
    @board = Array.new(7) {Array.new(6, " ")}
  end

  def display_board
    row = 0
    col = 0
    6.times do
      print "|"
      7.times do
        print @board[col][row] + "|"
        col += 1
      end
      col = 0
      row += 1
      puts ""
    end
    puts " 1 2 3 4 5 6 7"
  end

  def colum_full?(col)
    if @board[col-1][0] == "X" || @board[col-1][0] == "O"
      return true
    else
      return false
    end
  end

  def piece_row_placement(col)
    row = 0
    while row < 6 do
      if @board[col-1][row] == "X" || @board[col-1][row] == "O"
        return row - 1
      elsif row == 5
        return row
      end
      row += 1
    end
  end

  def vertical_win?(player, col)
    row = 0
    counter = 0

    while row < 6 do
      if @board[col-1][row] == player
        counter += 1
      else
        counter = 0
      end
      return true if counter == 4
      row += 1
    end
    return false
  end

  def horizontal_win?(player, row)
    col = 0
    counter = 0
    while col <= 6 do
      if @board[col][row] == player
        counter += 1
      else
        counter = 0
      end
      return true if counter == 4
      col += 1
    end
    return false
  end

  def tie?
    col = 0
    counter = 0
    while col <= 6 do
      if @board[col][0] == "X" || @board[col][0] == "O"
        counter += 1
      end
      return true if counter == 7
      col += 1
    end
    return false
  end

  def diagonal_win?(player, col, row)
    counter = 0
    counter += diagonal_up_right(player, col-1, row)
    counter += diagonal_down_left(player, col-1, row)
    return true if counter == 4
    counter = 0
    counter += diagonal_up_left(player, col-1, row)
    counter += diagonal_down_right(player, col-1, row)
    return true if counter == 4
    return false if counter != 4
  end

  def diagonal_up_left(player, col, row)
    counter = 0
    while col > -1 do
      if @board[col][row] == player
        counter += 1
      else
        return counter
      end
      return counter if counter == 4
      col -= 1
      row -= 1
    end
    return counter
  end

  def diagonal_up_right(player, col, row)
    counter = 0
    while col < 7 do
      if @board[col][row] == player
        counter += 1
      else
        return counter
      end
      return counter if counter == 4
      col += 1
      row -= 1
    end
    return counter
  end

  def diagonal_down_right(player, col, row)
    counter = 0
    while col < 7 do
      if @board[col][row] == player
        counter += 1
      else
        return counter - 1
      end
      return counter - 1 if counter == 4
      col += 1
      row += 1
    end
    return counter - 1
  end

  def diagonal_down_left(player, col, row)
    counter = 0
    while col > -1 do
      if @board[col][row] == player
        counter += 1
      else
        return counter - 1
      end
      return counter - 1 if counter == 4
      col -= 1
      row += 1
    end
    return counter - 1
  end

  def valid_colum?(colum)
    if (1..7).to_a.include?(colum)
      return true
    else
      return false
    end
  end

end
