class InputFormatter
  require_relative 'point.rb'
  attr_reader :grid, :drops, :error

  def initialize(input='')
    @error = ""
    @grid = format_input(input)
    @drops = format_drops(input)
  end

  def format_input(input)
    grid_size_array = input.scan(/\d\w\d/)
    return @error << 'You need to pass in numbers for the grid max coordinates' unless grid_size_array.any?
    grid_size_array = grid_size_array.first.split('x')
    max_long = grid_size_array[0].to_i
    max_lat = grid_size_array[1].to_i
    Point.new(max_long, max_lat)
  end

  def format_drops(input)
    drops = []
    drop_offs = input.scan(/-?\d+,\s?-?\d+/)
    return @error << 'You need to pass in numbers for the delivery coordinates' unless drop_offs.any?
    drop_offs.each do |drop_off|
      long = drop_off.split(',').first.to_i
      lat = drop_off.split(',').last.to_i
      drops << Point.new(long, lat)
    end
    drops
  end
end

