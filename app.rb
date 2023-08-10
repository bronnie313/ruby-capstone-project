require 'json'
require_relative 'musicAlbum/genre'
require_relative 'musicAlbum/music_album'

class App
  def initialize
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
end
