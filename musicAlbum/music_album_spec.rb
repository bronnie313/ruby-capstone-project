require_relative 'music_album'
require 'date'

describe MusicAlbum do
  let(:name) { 'Album Name' }
  let(:publish_date) { '2023-08-11' }
  let(:genre) { double('Genre', name: 'Rock') }
  let(:music_album) { MusicAlbum.new(name, Date.parse(publish_date), genre) }

  context 'when initializing the music album' do
    it 'should return the on_spotify value' do
      expect(music_album.on_spotify).to be(true)
    end

    it 'should have the correct attributes' do
      expect(music_album.name).to eq(name)
      expect(music_album.publish_date).to eq(Date.parse(publish_date))
      expect(music_album.genre).to eq(genre)
    end
  end

  context 'when checking if the music album can be archived' do
    it 'should return false when super class cannot be archived' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)
      expect(music_album.send(:can_be_archived?)).to be(false)
    end
  end
end
