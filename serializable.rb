module Serializable
  def deserialize(yaml_string)
    data = YAML.load(yaml_string)
    new(
              data[:dictionary],
              data[:secret_word],
              data[:current_guess_progress],
              data[:incorrect_guess_count],
              data[:incorrect_guesses]
            )
  end

  def serialize
    YAML.dump({
                dictionary: @dictionary,
                secret_word: @secret_word,
                current_guess_progress: @current_guess_progress,
                incorrect_guess_count: @incorrect_guess_count,
                incorrect_guesses: @incorrect_guesses
              })
  end

  def save_game(game_id)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

    file_name = "saved_games/game_#{game_id}.yml"

    #TODO
  end
end
