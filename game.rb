require_relative 'player'

class Game
  attr_reader :dictionary

  def initialize
    @dictionary = clean_dictionary(load_dictionary)
    @secret_word = choose_word
  end

  private

  def load_dictionary
    File.readlines('dictionary.txt', chomp: true)
  end

  def clean_dictionary(dict)
    dict.select do |word|
      correct_length?(word) && !proper_noun?(word)
    end
  end

  def correct_length?(word)
    word.length >= 5 && word.length <= 12
  end

  def proper_noun?(word)
    word == word.capitalize
  end

  def choose_word
    'Coming soon'
  end
end

