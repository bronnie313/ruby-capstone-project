require 'json'
require './app'

class Music
  def start
    puts 'Catalog of my things'
    @display = Display.new
    @app_instance = App.new

    @app_instance.load_data_from_files

    trap('INT') do
      puts "\nExited the application unexpectedly. Saving data ... "
      @app_instance.save_data_to_files
      puts 'Data saved successfully.'
      exit
    end

    loop do
      @display.display_menu

      choice = gets.chomp.to_i

      case choice
      when 1
        @app_instance.list_all_music_albums
      when 2
        @app_instance.list_all_genres
      when 3
        @app_instance.add_music_album
      # when 4
      #   @app_instance.display_games
      # when 5
      #   @app_instance.display_authors
      # when 6
      #   @app_instance.add_game
      when 7
        puts 'Thank you for using this application Saving data...'
        @app_instance.save_data_to_files
        break
      else
        puts 'Invalid choice. Please try again'
      end
    end
  end
end

class Display
  def display_menu
    puts "\nPlease choose an option by entering a number:"
    puts '1 - list all music albums'
    puts '2 - list all genres'
    puts '3 - Add a music album'
    puts '4 - list of games'
    puts '5 - list all authors'
    puts '6 - Add a game'
    puts '7 - Exit'
  end
end
