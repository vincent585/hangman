require_relative 'player'
require_relative 'displayable'

class Game
  include Displayable
  attr_reader :dictionary, :incorrect_guesses, :incorrect_guess_count, :current_guess_progress

  def initialize
    @dictionary = clean_dictionary(load_dictionary)
    @secret_word = choose_word.chars
    @current_guess_progress = secret_word_to_underscores
    @incorrect_guess_count = 0
    @incorrect_guesses = []
  end

  def play_game
    instructions
    loop do
      return game_lost if incorrect_guess_count == 6
      return game_won if current_guess_progress == secret_word

      guess = prompt_for_guess
      if correct_guess?(guess)
        update_current_guess_progress(guess)
      else
        update_incorrect_guesses(guess)
        @incorrect_guess_count += 1
      end
      show_incorrect_guess_count
      show_incorrect_guesses
      show_guess_progress
    end
  end

  private

  attr_reader :secret_word

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

  def secret_word_to_underscores
    secret_word.map { '_' }
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

  def correct_guess?(guess)
    secret_word.include?(guess)
  end

  def update_current_guess_progress(guess)
    secret_word.each_with_index do |letter, index|
      current_guess_progress[index] = guess if letter == guess
    end
  end

  def update_incorrect_guesses(guess)
    incorrect_guesses << guess
  end
end

x = Game.new
x.play_game
