require 'rspec'
require './lib/main.rb'

describe 'Connect Four game logic' do

  describe "The Board" do 
    it 'has a board' do 
      myboard = Board.new 
      expect(myboard.positions).not_to equal nil 
    end

    it 'has cols of 7' do 
      myboard = Board.new 
      expect(myboard.positions[0].size).to eq 7
    end

    it 'has rows of 6' do
      myboard = Board.new 
      expect(myboard.positions.size).to eq 6
    end
  end
  
  describe "The Player" do 
    it "has a name" do 
      playerx = Player.new("playerx")
      expect(playerx.name).to eq "playerx" 
    end
    
    it "has a token" do 
      playerx = Player.new("playerx","red")
      expect(playerx.token).to eq "red"
    end
  end



  describe "The Game" do 

    it "game over when board full" do 
      game1 = Game.new 
      game1.board.positions = [
        ["◎", "◎", "●", "◎", "◎", "●", "●"],
        ["●", "◎", "◎", "●", "●", "◎", "◎"],
        ["◎", "●", "◎", "◎", "◎", "●", "●"],
        ["●", "◎", "●", "●", "●", "◎", "◎"],
        ["◎", "●", "●", "◎", "◎", "●", "●"],        
        ["●", "◎", "●", "●", "◎", "◎", "●"]
      ]
      expect(game1.game_over?).to eq true
    end
    
    it "board is full when no empty circle" do 
      game1 = Game.new 
      game1.board.positions = [
        ["◎", "◎", "●", "◎", "◎", "●", "●"],
        ["●", "◎", "◎", "●", "●", "◎", "◎"],
        ["◎", "●", "◎", "◎", "◎", "●", "●"],
        ["●", "◎", "●", "●", "●", "◎", "◎"],
        ["◎", "●", "●", "◎", "◎", "●", "●"],        
        ["●", "◎", "●", "●", "◎", "◎", "●"]
      ]
      expect(game1.board_full?).to eq true
    end    
    
    
    it "board is not full there are empty spots" do 
      game1 = Game.new 
      game1.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],        
        ["●", "●", "●", "●", "◌", "◌", "◌"]
      ]
      expect(game1.board_full?).to eq false
    end
  
    it "game over when winner" do 
      game2 = Game.new 
      game2.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],        
        ["●", "●", "●", "●", "◌", "◌", "◌"]
      ]
      expect(game2.game_over?).to eq true
    end

    it "wins if four in a row" do 
      game3 = Game.new 
      game3.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "●", "●", "●"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],        
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"]
      ]
      expect(game3.row_win?).to eq true
    end

    it "wins if four in a col" do 
      game4 = Game.new
      game4.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],        
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"]
      ]
      expect(game4.col_win?).to eq true
    end 

    it "wins if four in a forward diagonal" do
      game5 = Game.new 
      game5.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "●", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "●", "◌"],        
        ["◌", "◌", "◌", "◌", "◌", "◌", "●"]
      ]
      expect(game5.fordia_win?).to eq true
    end

    it "wins if four in a backward diagonal" do 
      game6 = Game.new
      game6.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "●", "◌"],
        ["◌", "◌", "◌", "◌", "●", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
        ["◌", "◌", "●", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],        
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"]
      ]
      expect(game6.backdia_win?).to eq true
    end

    

  end

end
