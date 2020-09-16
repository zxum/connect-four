# Pseudocode
# Start Game (initialize board and players)
# Show instructions
# Players pick colors of tokens
# Start round 1
# See board
# Player 1 picks column
# Display updated board
# Check if game is over
# Player 2 picks column
# Check if game is over
# repeat rounds until game_over
# game is over when all cells are filled or winner is true
# winner is true if Player 1 or Player 2 tokens make a line of 4
# Display winner

class Board 
  attr_accessor :positions 

  def initialize
    @positions = make_board 
  end

  def display_board
    puts "╔════════════════╗"
    puts "  1 2 3 4 5 6 7  "
    @positions.each do |row|
      puts "  #{row.join(" ")} "
    end 
    puts "╚════════════════╝"
  end

  private 
  def make_board 
    b = []
    6.times { b.push(%w(◌)*7) }
    b
  end 
end

myBoard = Board.new 

class Player 
  attr_accessor :name, :token

  def initialize(name = nil, token = "●")
    @name = name 
    @token = token
  end 
end



class Game 
  attr_accessor :player1, :player2, :board

  def initialize
    @player1 = Player.new("player1")
    @player2 = Player.new("player2","◎")
    @board = Board.new
  end 


  def start_game 
  end

  def instructions 
  end 

  

  def game_over? 
    return true if board_full? || winner?
  end

  def board_full? 
    return true if @board.positions.flatten.each { |pos|
      return false if pos == "◌"
    }
  end

  def winner?
    return true if row_win? || col_win? || fordia_win? || backdia_win?
  end

  def row_win? 
    return true if @board.positions.each do |row| 
      i = 0 
      while i < 4
        return true if (row[i] == "●" && 
          row[i+1] == "●" && 
          row[i+2] == "●" && 
          row[i+3] == "●") ||  
          (row[i] == "◎" && 
          row[i+1] == "◎" && 
          row[i+2] == "◎" && 
          row[i+3] == "◎")
        i += 1
      end
    end
  end

  def col_win?
    row = 0 
    col = 0
    while row < 3 
      while col < 7 
        return true if (@board.positions[row][col] == "●" && 
          @board.positions[row+1][col] == "●" && 
          @board.positions[row+2][col] == "●" && 
          @board.positions[row+3][col] == "●") ||
          (@board.positions[row][col] == "◎" && 
          @board.positions[row+1][col] == "◎" && 
          @board.positions[row+2][col] == "◎" && 
          @board.positions[row+3][col] == "◎")
        col += 1
      end 
      col = 0 
      row += 1 
    end
  end

  def fordia_win? 
    row = 0 
    col = 0
    while row < 3 
      while col < 7 
        return true if (@board.positions[row][col] == "●" && 
          @board.positions[row+1][col+1] == "●" && 
          @board.positions[row+2][col+2] == "●" && 
          @board.positions[row+3][col+3] == "●") || 
          (@board.positions[row][col] == "◎" && 
          @board.positions[row+1][col+1] == "◎" && 
          @board.positions[row+2][col+2] == "◎" && 
          @board.positions[row+3][col+3] == "◎")
        col += 1
      end 
      col = 0 
      row += 1 
    end
  end 

  def backdia_win?
    row = 0 
    col = 0
    while row < 3 
      while col < 7 
        return true if (@board.positions[row][col] == "●" && 
          @board.positions[row+1][col-1] == "●" && 
          @board.positions[row+2][col-2] == "●" && 
          @board.positions[row+3][col-3] == "●") || 
          (@board.positions[row][col] == "◎" && 
          @board.positions[row+1][col-1] == "◎" && 
          @board.positions[row+2][col-2] == "◎" && 
          @board.positions[row+3][col-3] == "◎")
        col += 1
      end 
      col = 0 
      row += 1 
    end
  end
end

myGame = Game.new 
p myGame
# p myGame.col_win?
# p myGame.board.positions


# @board.positions = [
#   ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
#   ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
#   ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
#   ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
#   ["◌", "◌", "◌", "●", "◌", "◌", "◌"],        
#   ["◌", "◌", "◌", "●", "◌", "◌", "◌"]
# ]

# p "row:#{row} col:#{col} #{@board.positions[row][col]} #{@board.positions[row+1][col+1]} #{@board.positions[row+2][col+2]} #{@board.positions[row+3][col+3]}" 

