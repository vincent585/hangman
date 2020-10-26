module Displayable
  def instructions
    puts <<~HEREDOC
                              Welcome to Hangman!

      The rules are simple - each round, you'll be prompted to guess a letter.
      If that letter is correct, you'll see where that letter is in the secret word.
      If it's wrong, you'll see your incorrect guesses go up by one.
      If you can guess the secret word in less than 6 guesses, you win! Otherwise, well... 
      
                            R.I.P. Your hanging man.
                            
    HEREDOC
  end

  def guess_prompt_message
    puts 'Enter a letter! (a-z)'
  end

  def invalid_input_message
    puts 'Please only enter a single letter, (a-z).'
  end

  def show_guess_progress
    puts current_guess_progress.join(' ')
    puts
  end

  def show_incorrect_guesses
    puts "Incorrect guesses: #{incorrect_guesses.join(', ')}"
    puts
  end

  def show_incorrect_guess_count
    puts "Incorrect guess count: #{incorrect_guess_count}"
  end

  def game_lost
    puts "Game over! The secret word was \"#{secret_word.join}\"."
  end

  def game_won
    puts 'Nice job! Hangman is forever in your debt.'
  end
end
