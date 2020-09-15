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

  def initialize(name = nil, token = "yellow")
    @name = name 
    @token = token
  end 
end