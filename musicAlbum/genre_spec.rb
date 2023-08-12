require_relative 'genre' # Adjust the path to the Genre class

describe Genre do
  let(:genre) { Genre.new('Rock') }
  let(:item) { double('Item') } # Creating a mock item object

  context 'when initializing a genre' do
    it 'should have the correct id and name' do
      expect(genre.instance_variable_get(:@name)).to eq('Rock')
    end

    it 'should have an empty items array initially' do
      expect(genre.instance_variable_get(:@items)).to be_empty
    end
  end

  context 'when adding an item to the genre' do
    it 'should set the genre of the added item' do
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
    end
  end
end
