require_relative '../item'

class MusicAlbum < Item
  attr_reader :name, :genre, :publish_date 
  attr_accessor :on_spotify 

  def initialize(name, publish_date, genre, on_spotify: true)
    super(rand(1..100), publish_date, genre, nil, nil, nil)
    @name = name
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && on_spotify
  end
end
