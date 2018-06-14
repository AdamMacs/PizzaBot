require 'rspec'
require_relative '../lib/pizza_bot'
require_relative '../lib/input_formatter'

context InputFormatter do
  describe 'should return string' do
    bot = Pizzabot.new
    it 'with correct directions' do
      input = InputFormatter.new('5x6 (1, 3) (4, 4)')
      expect(bot.delivery_instructions(input.grid, input.drops)).to eq('ENNNDEEEND')
    end
    it 'with error' do
      input = InputFormatter.new('5x5 (1, 3) (4, 6)')
      expect(bot.delivery_instructions(input.grid, input.drops)).to eq('Cant drop outside route')
    end
    it '3 times E' do
      expect(bot.send(:format_delivery,'E', 3)).to eq('EEE')
    end
    it '3 times N' do
      bot = Pizzabot.new
      start = Point.new(0,0)
      drop = Point.new(3,3)
      expect(bot.send(:find_lat_diff,start.lat, drop.lat)).to eq(['NNN'])
    end
    it '3 times S' do
      bot = Pizzabot.new
      start = Point.new(3,3)
      drop = Point.new(0,0)
      expect(bot.send(:find_lat_diff,start.lat, drop.lat)).to eq(['SSS'])
    end
    it '3 times E' do
      bot = Pizzabot.new
      start = Point.new(3,3)
      drop = Point.new(0,0)
      expect(bot.send(:find_long_diff,start.long, drop.long)).to eq(['WWW'])
    end
    it '3 times W' do
      bot = Pizzabot.new
      start = Point.new(0,0)
      drop = Point.new(3,3)
      expect(bot.send(:find_long_diff,start.long, drop.long)).to eq(['EEE'])
    end
  end
end