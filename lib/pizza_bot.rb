require_relative 'delivery_route.rb'
class PizzaBot

  NORTH = 'N'.freeze
  SOUTH = 'S'.freeze
  EAST = 'E'.freeze
  WEST = 'W'.freeze
  DROP = 'D'.freeze

  attr_reader :coords
  attr_accessor :current_point, :instructions, :x_difference, :y_difference

  def initialize(input)
    @instructions = ''
    @delivery_route = DeliveryRoute.new(input).prepare_route
  end

  def deliver
    @delivery_route.each_cons(2) do |address_pair|
        start, finish = address_pair
        travel(start, finish)
        drop
    end
    self
  end

  def travel(start, finish)
    @x_difference = (start[0] - finish[0]).abs
    @y_difference = (start[1] - finish[1]).abs
    start[0] < finish[0] ?  east : west
    start[1] < finish[1] ? north : south
  end

  def drop
    @instructions << DROP
  end

  def north
    @instructions << NORTH * @y_difference
  end

  def south
    @instructions << SOUTH * @y_difference
  end

  def east
    @instructions << EAST * @x_difference
  end

  def west
    @instructions << WEST * @x_difference
  end
end