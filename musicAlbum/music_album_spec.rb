require_relative 'music_album'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new }

  context 'when initializing the music album' do
    it 'should return the on_spotify value' do
      expect(music_album.on_spotify).to be(true)
    end
  end
end
