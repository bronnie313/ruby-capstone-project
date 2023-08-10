require_relative 'book'
require_relative 'label'

class AddBook
  def initialize
    @books = []
    @labels = []
  end

  def add_book
    puts 'Please enter Publisher Name:'
    publisher = gets.chomp
    puts 'Please enter cover state (good or bad):'
    cover_state = gets.chomp
    puts 'Please enter publish date in year/month/date(2022/04/25) format:'
    publish_date = gets.chomp
    puts 'Please enter the label title:'
    title = gets.chomp
    puts 'Please enter the label color:'
    color = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    @books.push(book)
    label = Label.new(title, color)
    @labels.push(label)
    puts 'Book created successfully'
  end

  def list_books
    @books.each do |book|
      puts "Publisher: #{book.publisher}, Publish date: #{book.publish_date}, Cover State: #{book.cover_state}"
    end
  end

  def save_books
    books = @books.each_with_index.map do |book, index|
      {
        publisher: book.publisher, publish_date: book.publish_date, cover_state: book.cover_state, index: index
      }
    end
    File.write('books.json', JSON.generate(books))
  end

  def load_books
    return unless File.exist?('books.json')

    read_file = File.read('books.json')
    json = JSON.parse(read_file)

    loaded_books = json.map do |book|
      Book.new(book['publish_date'], book['publisher'], book['cover_state'])
    end
    @books = loaded_books
  end

  def list_labels
    @labels.each do |label|
      puts "Title: #{label.title}, color: #{label.color}"
    end
  end

  def save_labels
    labels = @labels.each_with_index.map do |label, index|
      {
        index: index, title: label.title, color: label.color
      }
    end
    File.write('labels.json', JSON.generate(labels))
  end

  def load_labels
    return unless File.exist?('labels.json')

    read_file = File.read('labels.json')
    json = JSON.parse(read_file)

    loaded_labels = json.map do |label|
      Label.new(label['title'], label['color'])
    end
    @labels = loaded_labels
  end
end
