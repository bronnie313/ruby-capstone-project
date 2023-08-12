require_relative 'app'
require_relative 'catalog'
require_relative 'game_console'

def main
  app = App.new
  catalog = Music.new

  app.load_data

  puts 'Welcome to our catalog app'
  loop do
    puts 'Please select an option:'
    puts '1. option for books'
    puts '2. option for music'
    puts '3. option for games'
    puts '4. Exit'

    print 'Please select an option:'
    choice = gets.chomp.to_i

    case choice
    when 1
      app.display_options
    when 2
      catalog.start
    when 3
      app.display_game_author_options
    when 4
      # app.save_data_to_files
      break
    end
  end

  app.save_data
end

main
