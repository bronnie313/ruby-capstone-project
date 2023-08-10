require 'date'

class Item
  # attr_reader :genre, :author, :source, :label, :publish_date
  # attr_accessor :archived
  attr_reader :id, :genre, :author, :source, :label, :publish_date, :archived

  # def initialize(genre, author, label, publish_date, id = Random.rand(1..10_000))
  def initialize(id = Random.rand(1..10_000))
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def add_label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def can_be_archived?
    current_year = Time.now.year
    publish_date = Date.parse(@publish_date)
    age_in_years = current_year - publish_date.year
    age_in_years > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      true
    else
      false
    end
  end
end
