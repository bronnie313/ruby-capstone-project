require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'add_book'
require 'json'

class App
  attr_accessor :books, :labels

  def initialize
    @books = AddBook.new
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
