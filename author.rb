require_relative 'item'

class Author
  attr_accessor :firstname, :lastname
  attr_reader :items

  def initialize(firstname, lastname)
    @id = rand(1...1000)
    @firstname = firstname
    @lastname = lastname
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.add_author = self
  end
end
