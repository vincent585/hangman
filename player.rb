class Player
  attr_reader :name

  def initialize
    @name = player_name
  end

  def player_name
    puts "What's your name?"
    gets.chomp
  end
end
