class DeliveryRoute
  class ParserError < ArgumentError; end

  AREA_REGEX = /\d+\s?x\s?\d+/
  COORDS_REGEX = /\((.*?)\)/
  DIGITS_EXTRACT_REGEX = /\d+/

  attr_reader :area
  attr_accessor :coords

  def initialize(input)
    @area = input[AREA_REGEX]&.split('x')&.map(&:to_i)
    @coords = input.scan(COORDS_REGEX).flatten
  end

  def prepare_route
    validate_area
    validate_route
  end

  private

  def validate_area
    raise ArgumentError, "Unable to find grid info from input string" unless area
  end

  def validate_route
    @coords.map! do |address|
      coords = address.split(/,\s?/).map(&:to_i)
      contains_negatives(coords)
      valid_coordinates(coords)
      out_of_bounds(coords)
      coords
    end
    @coords.unshift([0,0])
  end

  def contains_negatives(coords)
    raise ArgumentError, "Coordinates cannot contain negatives" if coords.any?{|x| x.negative? }
  end

  def valid_coordinates(coords)
    raise ArgumentError, "Coords should only have two points" unless coords.length == 2
  end

  def out_of_bounds(coords)
    raise ArgumentError, "Coord out of grid bounds" if coords[0] > area[0] || coords[1] > area[1]
  end
end
