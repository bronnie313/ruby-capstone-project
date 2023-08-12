require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :published_date, :authors
  attr_reader :id, :title

  def initialize(title, multiplayer, last_played_at, published_date, authors = [])
    @id = Random.rand(1..1000)
    super(published_date)
    @title = title
    @last_played_at = last_played_at
    @published_date = published_date
    @multiplayer = multiplayer
    @authors = []
    add_authors(authors)
  end

  def to_hash
    {
      id: @id,
      title: @title,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      published_date: @published_date,
      author_ids: @authors.map(&:id)
    }
  end

  def self.json_create(object)
    new(object['title'], object['multiplayer'], object['last_played_at'], object['published_date'], object['authors'])
  end

  def add_authors(authors)
    authors.each { |author| add_author(author) }
  end

  def add_author(author)
    return if authors.include?(author)

    authors << author
    author.add_item(self)
  end

  def can_be_archived?
    super && last_played_at < 2.years.ago
  end
end
