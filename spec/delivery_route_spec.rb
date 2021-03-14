require 'rspec'
require_relative '../lib/delivery_route'

context DeliveryRoute do
  describe 'prepare_route' do
    dr = DeliveryRoute.new('5c6 (1, 3) (4, 4)')
    it 'raises error that grid input is not correct' do
      expect { dr.prepare_route }.to raise_error(ArgumentError).with_message('Unable to find grid info from input string')
    end
    dr1 = DeliveryRoute.new('5x6 (-1, 3) (4, 4)')
    it 'raises error that coordinates cannot be negative' do
      expect { dr1.prepare_route }.to raise_error(ArgumentError).with_message('Coordinates cannot contain negatives')
    end
    dr2 = DeliveryRoute.new('5x6 (1, 3, 5) (4, 4)')
    it 'raises error that there should only be two points in a coordinate' do
      expect { dr2.prepare_route }.to raise_error(ArgumentError).with_message('Coords should only have two points')
    end
    dr3 = DeliveryRoute.new('5x6 (8, 3) (4, 4)')
    it 'raises error that the coordinate is out of bounds' do
      expect { dr3.prepare_route }.to raise_error(ArgumentError).with_message('Coord out of grid bounds')
    end
  end
end