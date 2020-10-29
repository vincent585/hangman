module Serializable
  def deserialize(game_id)
    file_name = "saved_games/game_#{game_id}.yml"
    data = YAML.load(File.read(file_name))
    data.each do |variable, value|
      instance_variable_set(variable, value)
    end
  end

  def serialize
    obj = instance_variables.each_with_object({}) do |var, object|
      object[var] = instance_variable_get var
      object
    end
    YAML.dump(obj)
  end

  def save_game(game_id)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

    file_name = "saved_games/game_#{game_id}.yml"

    File.open(file_name, 'w') { |file| file.puts serialize }
    puts 'Game saved.'
  end
end
