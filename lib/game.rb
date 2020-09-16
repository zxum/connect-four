class Game 
  attr_accessor :player1, :player2, :board, :winner

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2","◎")
    @board = Board.new
    @winner = nil 
  end 


  def start_game 
    instructions 
    play 
  end

  private 
  def instructions 
    puts "Welcome to a game of Connect Four."
    puts "This is a two player game."
    puts "Player 1's token will look like this ●"
    puts "Player 2's token will look like this ◎"
    puts "and the board looks like this"
    @board.display_board
    puts "When it's your turn, select a row, and "
    puts "your token will fall to the bottom. "
    puts "To win, you must have four tokens in a "
    puts "row, horizontally, vertically, or "
    puts "diagonally. Otherwise, game will end "
    puts "when the board is full. Have fun!"
  end 

  def play 
    until game_over? == true  
      puts "Player 1, please select a column."
      p1 = get_pos
      select_position(@player1,p1)
      @board.display_board
      break if game_over? == true
      puts "Player 2, please select a column."
      p2 = get_pos
      select_position(@player2,p2)
      @board.display_board
    end 

    if !@winner.nil?
      puts "#{@winner} wins!"
    else 
      puts "It's a draw! Thanks for playing."
    end
    
    exit
  end


  def get_pos
    puts "Please select a column from (1 to 7)"
    pos = gets.chomp.to_i
    if (1..7).include? pos 
      return pos-1 
    else 
      puts "Please enter a valid column."
      get_pos
    end 
  end
  

  def select_position(player,position)
    col = position.to_i 
    row = col_fall(player,col)
    @board.positions[row][col] = player.token 
  end

  def col_fall(player,col)
    row = 5 
    while row > 0  
      if @board.positions[row][col] == "◌" 
        return row
      end
      row -= 1 
    end 
  end

  def game_over? 
    ( board_full? == true || winner? == true ) ? true : false 
  end

  def board_full? 
    positions = @board.positions.flatten 
    !positions.include?("◌") ? true : false 
  end

  def winner?
    (row_win? || col_win? || fordia_win? || backdia_win?) ? true : false 
  end

  def row_win? 
    @board.positions.each do |row| 
      i = 0 
      while i < 4
        if (row[i] == "●" && 
          row[i+1] == "●" && 
          row[i+2] == "●" && 
          row[i+3] == "●") 
          @winner = @player1.name 
          return true  
        elsif (row[i] == "◎" && 
          row[i+1] == "◎" && 
          row[i+2] == "◎" && 
          row[i+3] == "◎")
          @winner = @player2.name 
          return true
        end
        i += 1
      end
    end
    false 
  end

  def col_win?
    row = 0 
    col = 0
    while row < 3 
      while col < 7 
        if (@board.positions[row][col] == "●" && 
          @board.positions[row+1][col] == "●" && 
          @board.positions[row+2][col] == "●" && 
          @board.positions[row+3][col] == "●") 
          @winner = @player1.name
          return true 
        elsif (@board.positions[row][col] == "◎" && 
          @board.positions[row+1][col] == "◎" && 
          @board.positions[row+2][col] == "◎" && 
          @board.positions[row+3][col] == "◎")
          @winner = @player2.name
          return true
        end
        col += 1
      end 
      col = 0 
      row += 1 
    end
    false 
  end

  def fordia_win? 
    row = 0 
    col = 0
    while row < 3 
      while col < 7 
        if (@board.positions[row][col] == "●" && 
          @board.positions[row+1][col+1] == "●" && 
          @board.positions[row+2][col+2] == "●" && 
          @board.positions[row+3][col+3] == "●")
          @winner = @player1.name
          return true 
        elsif (@board.positions[row][col] == "◎" && 
          @board.positions[row+1][col+1] == "◎" && 
          @board.positions[row+2][col+2] == "◎" && 
          @board.positions[row+3][col+3] == "◎")
          @winner = @player2.name
          return true
        end
        col += 1
      end 
      col = 0 
      row += 1 
    end
    false 
  end 

  def backdia_win?
    row = 0 
    col = 0
    while row < 3 
      while col < 7 
        if (@board.positions[row][col] == "●" && 
          @board.positions[row+1][col-1] == "●" && 
          @board.positions[row+2][col-2] == "●" && 
          @board.positions[row+3][col-3] == "●") 
          @winner = @player1.name
          return true 
        elsif (@board.positions[row][col] == "◎" && 
          @board.positions[row+1][col-1] == "◎" && 
          @board.positions[row+2][col-2] == "◎" && 
          @board.positions[row+3][col-3] == "◎")
          @winner = @player2.name
          return true
        end 
        col += 1
      end 
      col = 0 
      row += 1 
    end
  end
  false 
end