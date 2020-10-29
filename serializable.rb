module Serializable
  def deserialize(yaml_string)
    data = YAML.load(yaml_string)
    new(
              data[:secret_word],
              data[:current_guess_progress],
              data[:incorrect_guess_count],
              data[:incorrect_guesses]
            )
  end

  def serialize
    YAML.dump(self)
  end

  def save_game(game_id)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

    file_name = "saved_games/game_#{game_id}.yml"

    File.open(file_name, 'w') { |file| file.puts serialize }
    puts 'Game saved.'
  end
end
