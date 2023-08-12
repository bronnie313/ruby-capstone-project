require 'json'
require_relative 'game'
require_relative 'author'

class GameConsole
  attr_reader :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def display_games
    if games.empty?
      puts 'No games'
    else
      @games.each do |game|
        puts "Title: #{game.title}"
        puts "published date: #{game.published_date}"
        puts "multy player: #{game.multiplayer}"
      end
    end
    puts 'games displayed'
  end

  def save_games
    games = @games.each_with_index.map do |game, index|
      {
        Title: game.title, published_date: game.published_date, multy_player: game.multiplayer, index: index
      }
    end
    File.write('games.json', JSON.generate(games))
  end

  def load_games
    return unless File.exist?('games.json')

    read_file = File.read('games.json')
    json = JSON.parse(read_file)

    loaded_games = json.map do |game|
      Game.new(game['title'], game['multiplayer'], game['last_played_at'], game['publish_date'])
    end
    @games = loaded_games
  end

  def display_authors
    if authors.empty?
      puts 'No author'
    else
      puts 'Authors'
      @authors.each do |author|
        puts "first name: #{author.firstname}", "last name: #{author.lastname}"
      end
    end
    puts 'author displayed'
  end

  def save_authors
    authors = @authors.each_with_index.map do |author, index|
      {
        index: index, firstname: author.firstname, lastname: author.lastname
      }
    end
    File.write('authors.json', JSON.generate(authors))
  end

  def load_authors
    return unless File.exist?('authors.json')

    read_file = File.read('authors.json')

    if read_file.empty?
      puts 'Authors file is empty.'
      return
    end

    json = JSON.parse(read_file)

    loaded_authors = json.map do |author|
      Author.new(author['firstname'], author['lastname'])
    end
    @authors = loaded_authors
  end

  def add_game
    puts 'Please enter game title:'
    title = gets.chomp
    puts 'Is the game multiplayer? (Y/N)'
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Please nter date of the last play (YYYY/MM/DD):'
    last_played_at = gets.chomp
    puts 'Enter game\'s publish date (YYYY/MM/DD):'
    publish_date = gets.chomp
    puts 'Please enter author first name:'
    first_name = gets.chomp
    puts 'Please enter author last name:'
    last_name = gets.chomp
    game = Game.new(title, multiplayer, last_played_at, publish_date, [])
    @games.push(game)
    author = Author.new(first_name, last_name)
    @authors.push(author)
    game.add_author(author)
    puts 'Game created successfully'
  end
end
