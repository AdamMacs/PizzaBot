require 'rspec'
require_relative '../lib/pizza_bot'

context PizzaBot do
  bot = PizzaBot.new('5x6 (1, 3) (4, 4)')
  describe 'deliver' do
    it 'returns correct directions' do
      bot.deliver
      expect(bot.instructions).to eq('ENNNDEEEND')
    end
  end

  describe 'travel' do
    bot1 = PizzaBot.new('5x6 (1, 3) (4, 4)')
    it 'returns D' do
      bot1.travel([0,0], [0,1])
      expect(bot1.instructions).to eq('N')
    end
  end

  bot2 = PizzaBot.new('5x6 (1, 3) (4, 4)')
    it 'returns E' do
      bot2.travel([0,0], [0,1])
      expect(bot2.instructions).to eq('N')
    end

  bot3 = PizzaBot.new('5x6 (1, 3) (4, 4)')
    it 'returns S' do
      bot3.travel([1,0], [0,0])
      expect(bot3.instructions).to eq('W')
    end

   bot4 = PizzaBot.new('5x6 (1, 3) (4, 4)')
    it 'returns N' do
      bot4.travel([0,0], [1,0])
      expect(bot4.instructions).to eq('E')
    end

    bot5 = PizzaBot.new('5x6 (1, 3) (4, 4)')
    it 'returns W' do
      bot5.travel([0,0], [0,1])
      expect(bot5.instructions).to eq('N')
    end
end