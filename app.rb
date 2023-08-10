require 'json'
require_relative 'musicAlbum/genre'
require_relative 'musicAlbum/music_album'
require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'add_book'

class App
  attr_accessor :books, :labels

  def initialize
    @books = AddBook.new
    @music_albums = []
    @genres = []
  end

  def list_all_music_albums
    puts 'List of Music Albums:'
    @music_albums.each_with_index do |album, index|
      puts "#{index + 1} - #{album.name} (Published: #{album.publish_date})"
    end
  end

  def list_all_genres
    puts 'List of Music Genres:'
    @genres.each do |genre|
      puts "- '#{genre.name}'"
    end
  end

  def add_music_album
    puts 'Enter music album details:'
    puts 'Enter album title:'
    name = gets.chomp

    puts 'Enter the date of release (yyyy/mm/dd):'
    publish_date = gets.chomp

    puts 'Is it on spotify? (y/n):'
    gets.chomp.downcase

    puts 'Enter the genre of the music album:'
    genre_name = gets.chomp.capitalize

    genre = @genres.find { |g| g.name == genre_name }
    unless genre
      genre = Genre.new(genre_name)
      @genres << genre
    end

    album = MusicAlbum.new(name, publish_date, genre)
    @music_albums << album
    puts 'Music album has been added successfully'
  end

  def save_data_to_files
    albums_data = @music_albums.map(&:to_hash)
    genres_data = @genres.map(&:to_hash)

    File.write('albums.json', JSON.pretty_generate(albums_data))

    File.write('genres.json', JSON.pretty_generate(genres_data))

    puts 'Data has been saved to JSON files.'
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

  def save_data
    @books.save_books
    @books.save_labels
  end

  def load_data
    @books.load_books
    @books.load_labels
  end

  def display_options(app)
    loop do
      puts 'Welcome! Please choose an option for books:'
      puts '1. List all books'
      puts '2. List all labels'
      puts '3. Add a book'
      puts '4. Exit'
      choice = gets.chomp.to_i

      case choice
      when 1
        books.list_books
      when 2
        books.list_labels
      when 3
        books.add_book
      when 4
        save_data
        app_options(app)
      end
    end
  end

  def load_json_data(file_name, class_type)
    if File.exist?(file_name)
      json_data = File.read(file_name)
      items = JSON.parse(json_data).map { |item_json| class_type.from_json(JSON.generate(item_json)) }
      items.compact
    else
      []
    end
  end

  def save_json_data(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end
end
