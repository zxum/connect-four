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
      playerx = Player.new("playerx","◎")
      expect(playerx.token).to eq "◎"
    end
  end



  describe "The Game" do 

    before(:each) do 
      @mygame = Game.new
    end

    it "game over when board full" do 
      @mygame.board.positions = [
        ["◎", "◎", "●", "◎", "◎", "●", "●"],
        ["●", "◎", "◎", "●", "●", "◎", "◎"],
        ["◎", "●", "◎", "◎", "◎", "●", "●"],
        ["●", "◎", "●", "●", "●", "◎", "◎"],
        ["◎", "●", "●", "◎", "◎", "●", "●"],        
        ["●", "◎", "●", "●", "◎", "◎", "●"]
      ]
      expect(@mygame.game_over?).to eq true
    end
    
    it "board is full when no empty circle" do 
      @mygame.board.positions = [
        ["◎", "◎", "●", "◎", "◎", "●", "●"],
        ["●", "◎", "◎", "●", "●", "◎", "◎"],
        ["◎", "●", "◎", "◎", "◎", "●", "●"],
        ["●", "◎", "●", "●", "●", "◎", "◎"],
        ["◎", "●", "●", "◎", "◎", "●", "●"],        
        ["●", "◎", "●", "●", "◎", "◎", "●"]
      ]
      expect(@mygame.board_full?).to eq true
    end    
    
    it "board is not full there are empty spots" do 
      @mygame.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],        
        ["●", "●", "●", "●", "◌", "◌", "◌"]
      ]
      expect(@mygame.board_full?).to eq false
    end
  
    it "game over when winner" do 
      @mygame.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],        
        ["●", "●", "●", "●", "◌", "◌", "◌"]
      ]
      expect(@mygame.game_over?).to eq true
    end

    it "wins if four in a row" do 
      @mygame.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "●", "●", "●"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],        
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"]
      ]
      expect(@mygame.row_win?).to eq true
    end

    it "wins if four in a col" do 
      @mygame.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],        
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"]
      ]
      expect(@mygame.col_win?).to eq true
    end 

    it "wins if four in a forward diagonal" do
      @mygame.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "●", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "●", "◌"],        
        ["◌", "◌", "◌", "◌", "◌", "◌", "●"]
      ]
      expect(@mygame.fordia_win?).to eq true
    end

    it "wins if four in a backward diagonal" do 
      @mygame.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "●", "◌"],
        ["◌", "◌", "◌", "◌", "●", "◌", "◌"],
        ["◌", "◌", "◌", "●", "◌", "◌", "◌"],
        ["◌", "◌", "●", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],        
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"]
      ]
      expect(@mygame.backdia_win?).to eq true
    end

    it "wins if four in a row for player2" do 
      @mygame.board.positions = [
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◌"],
        ["◌", "◌", "◌", "◌", "◌", "◌", "◎"],
        ["◌", "◌", "◌", "◌", "◌", "◎", "◌"],
        ["◌", "◌", "◌", "◌", "◎", "◌", "◌"],        
        ["◌", "◌", "◌", "◎", "◌", "◌", "◌"]
      ]
      expect(@mygame.winner?).to eq true
    end

    it "can add token to col" do 
      @mygame.select_position(@mygame.player1,"0")
      expect(@mygame.board.positions[5][0]).to eq(@mygame.player1.token)
    end

    it "can add token to col in next empty space from bottom" do 
      @mygame.select_position(@mygame.player1,"0")
      @mygame.select_position(@mygame.player2,"0") 
      expect(@mygame.board.positions[4][0]).to eq(@mygame.player2.token)
    end

  end

end
