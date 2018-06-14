require 'rspec'
require_relative '../lib/input_formatter'

context InputFormatter do
  describe 'should return max grid points' do
    it 'for width/longitude' do
      input =  "5x5 (1, 3) (4, 4)"
     test_input = InputFormatter.new(input)
    expect( test_input.grid.long).to eq(5)
    end
    it 'for width/longitude' do
      input =  "5x6 (1, 3) (4, 4)"
      test_input = InputFormatter.new(input)
      expect( test_input.grid.lat).to eq(6)
    end
  end

  describe 'should return array of points' do
    it 'drop should be of type Point' do
      input =  "5x5 (1, 3) (4, 4)"
      test_input = InputFormatter.new(input)
      expect( test_input.drops[0]).to be_a(Point)
    end
    it 'with 2 deliveries' do
      input =  "5x6 (1, 3) (4, 4)"
      test_input = InputFormatter.new(input)
      expect( test_input.drops.length).to eq(2)
    end
  end
end