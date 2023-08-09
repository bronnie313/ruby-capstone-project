require_relative './musicAlbum/genre'
require_relative './musicAlbum/music_album'

@music_albums = []

def list_all_music_albums
    puts 'List of Music Albums:'
   
end
 
def list_all_genres
    puts 'List of Music Genres:'
end

def add_music_album
    puts 'Enter music album details:'
    puts 'Enter album title:'
    title = gets.chomp

    puts 'Enter the date of release (yyyy/mm/dd):'
    publish_date = gets.chomp

    puts 'Is it on spotify? (y/n):'
    on_spotify = gets.chomp.downcase == 'y'

    puts 'Enter the genre of the music album:'
    genre = gets.chomp.downcase
    album = MusicAlbum.new(title, publish_date, on_spotify, genre: genre)
    @music_albums << album
    puts 'Music album has been added successfully'
end