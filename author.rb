require 'json'
require_relative 'item'

class Author
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'data' => {
        'name' => @name,
        'items' => @items
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    author = new(object['data']['name'])
    object['data']['items'].each do |item|
      author.add_item(item)
    end
    author
  end
end
