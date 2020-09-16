class Player 
  attr_accessor :name, :token

  def initialize(name = nil, token = "●")
    @name = name 
    @token = token
  end 
end