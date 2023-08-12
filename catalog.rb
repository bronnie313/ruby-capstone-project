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
      when 4
        puts 'Thank you for using this application Saving data...'
        @app_instance.save_data_to_files
        break
      else
        puts 'Invalid choice. Please try again'
      end
    end
  end

  def load_data_from_files
    if File.exist?('albums.json') && File.size?('albums.json').to_i.positive?
      albums_data = JSON.parse(File.read('albums.json'))
      @music_albums = albums_data.map { |data| MusicAlbum.from_hash(data) }
    end

    if File.exist?('genres.json') && File.size?('genres.json').to_i.positive?
      genres_data = JSON.parse(File.read('genres.json'))
      @genres = genres_data.map { |data| Genre.from_hash(data) }
    end

    puts 'Data has been loaded from JSON files.'
  end

  def save_data_to_files
    save_music_albums_to_file
    save_genres_to_file
  end

  def save_music_albums_to_file
    albums_data = @music_albums.map(&:to_hash)
    File.write('albums.json', JSON.pretty_generate(albums_data))
    puts 'Music albums data has been saved to JSON file.'
  end

  def save_genres_to_file
    genres_data = @genres.map(&:to_hash)
    File.write('genres.json', JSON.pretty_generate(genres_data))
    puts 'Genres data has been saved to JSON file.'
  end
end

class Display
  def display_menu
    puts "\nPlease choose an option by entering a number:"
    puts '1 - list all music albums'
    puts '2 - list all genres'
    puts '3 - Add a music album'
    puts '4 - Exit'
  end
end
