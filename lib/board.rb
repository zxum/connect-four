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