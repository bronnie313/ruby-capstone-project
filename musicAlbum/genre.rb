class Genre
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_hash
    {
      'name' => @name,
      'items' => @items.map(&:to_hash)
    }
  end

  def self.from_hash(hash)
    genre = new(hash['name'])
    hash['items'].each do |item_data|
      item = MusicAlbum.from_hash(item_data)
      genre.add_item(item)
    end
    genre
  end
end
