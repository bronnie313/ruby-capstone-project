require 'json'
require_relative 'item'

class Game < Item
  attr_accessor :last_played_at

  def initialize(title, genre, platform, last_played_at)
    super(title, genre, platform)
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && @last_played_at < Time.now - (2 * 365 * 24 * 60 * 60)
  end

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'data' => {
        'title' => @title,
        'genre' => @genre,
        'platform' => @platform,
        'last_played_at' => @last_played_at
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['data']['title'], object['data']['genre'], object['data']['platform'], object['data']['last_played_at'])
  end
end
