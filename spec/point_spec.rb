require 'rspec'
require_relative '../lib/point'

context Point do
  describe 'should create valid point' do
    it 'when passing valid args' do
      point = Point.new(2,2)
      expect(point.long).to eq(2)
    end
    it 'when passing valid args' do
      point = Point.new(2,2)
      expect(point.lat).to eq(2)
    end
  end

  describe 'should be valid drop' do
    it 'when passing valid args' do
      drop = Point.new(2,2)
      area = Point.new(5,5)
      expect(drop.valid_drop?(area)).to be true
    end
  end

  describe 'should be invalid drop' do
    it 'when passing invalid args' do
      drop = Point.new(6,2)
      area = Point.new(5,5)
      expect(drop.valid_drop?(area)).to be false
    end
  end
end
