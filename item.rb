class Item
  attr_reader :genre, :author, :source, :label, :publish_date
  attr_accessor :archived

  def initialize(id, publish_date, genre, author, source, label)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    current_year = Time.now.current_year
    publish_date = @publish_date.year 
    age_in_years = current_year - publish_date
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
