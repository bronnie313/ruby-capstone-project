class MusicAlbum
  attr_reader :on_spotify

  def initialize(on_spotify: true)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && on_spotify
  end
end
