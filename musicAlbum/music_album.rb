require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify, 

  def initialize(name, publish_date, genre, on_spotify: true)
    super(name, publish_date, genre)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && on_spotify
  end
end
