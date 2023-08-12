require_relative '../game_console'
require_relative '../game'
require_relative '../author'

RSpec.describe GameConsole do
  let(:console) { GameConsole.new }

  describe '#display_games' do
    it 'displays games' do
      game1 = Game.new('Game 1', true, '2023/01/01', '2022/01/01')
      game2 = Game.new('Game 2', false, '2023/01/01', '2022/01/01')
      console.instance_variable_get(:@games).push(game1, game2)
      expect { console.display_games }.to output(/Game 1.*Game 2/m).to_stdout
    end

    it 'displays no games message' do
      console.instance_variable_set(:@games, [])
      expect { console.display_games }.to output(/No games/).to_stdout
    end
  end
end

RSpec.describe Author do
  describe '#add_item' do
    it 'adds item to author' do
      author = Author.new('John', 'Doe')
      game = Game.new('Game', true, '2023/01/01', '2022/01/01')

      author.add_item(game)
      expect(author.items).to include(game)
    end

    it 'does not add duplicate items' do
      author = Author.new('John', 'Doe')
      game = Game.new('Game', true, '2023/01/01', '2022/01/01')

      author.add_item(game)
      author.add_item(game)
      expect(author.items.size).to eq(1)
    end
  end
end
