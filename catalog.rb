require 'json'
require './app'


class Music 
    def start
        puts 'Catalog of my things'
        @display = Display.new
         
        trap('INT') do
            puts "\nExited the application unExpectedly please try again"
            exit 
        end

        loop do 
            @display.display_menu
            
            choice = gets.chomp.to_i 

            case choice
            when 2
                list_all_music_albums
            when 4
                list_all_genres
            when 8
                add_music_album
            when 10
                puts 'Thank you for using this application'
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
        puts '1 - list all books'
        puts '2 - list all music albums'
        puts '3 - list of games'
        puts '4 - list all genres'
        puts '5 - list all labels'
        puts '6 - list all authors'
        puts '7 - Add a book'
        puts '8 - Add a music album'
        puts '9 - Add a game'
        puts '10 - Exit'
    end
end
