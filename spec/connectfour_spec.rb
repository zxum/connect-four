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
  
  


end
