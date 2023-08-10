require_relative 'genre' # Adjust the path to the Genre class

describe Genre do
  let(:genre) { Genre.new(1, 'Rock') }

  context 'when initializing a genre' do
    it 'should have the correct id and name' do
      expect(genre.instance_variable_get(:@id)).to eq(1)
      expect(genre.instance_variable_get(:@name)).to eq('Rock')
    end

    it 'should have an empty items array initially' do
      expect(genre.instance_variable_get(:@items)).to be_empty
    end
  end
end
