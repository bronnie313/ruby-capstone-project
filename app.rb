require_relative './musicAlbum/genre'
require_relative './musicAlbum/music_album'

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
        on_spotify = gets.chomp.downcase == 'y'

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
end