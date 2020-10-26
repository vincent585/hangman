require_relative 'player'
require_relative 'displayable'

class Game
  include Displayable
  attr_reader :dictionary

  def initialize
    @dictionary = clean_dictionary(load_dictionary)
    @secret_word = choose_word
  end

  def play_game
    prompt_for_guess
  end

  private

  def load_dictionary
    File.readlines('dictionary.txt', chomp: true)
  end

  def clean_dictionary(dict)
    dict.select do |word|
      correct_length?(word) && not_proper_noun?(word)
    end
  end

  def correct_length?(word)
    word.length >= 5 && word.length <= 12
  end

  def not_proper_noun?(word)
    word != word.capitalize
  end

  def choose_word
    dictionary.sample
  end

  def prompt_for_guess
    guess_prompt_message
    guess = gets.downcase.chomp
    until valid_guess?(guess)
      invalid_input_message
      guess = gets.downcase.chomp
    end
    guess
  end

  def valid_guess?(guess)
    guess.match?(/[a-z]/) && guess.length == 1
  end
end

x = Game.new
x.play_game
