# create pizza robot to make delicious deliveries
# frozen_string_literal: true.
class Pizzabot
	DROP = 'D'.freeze
	EAST = 'E'.freeze
	WEST = 'W'.freeze
	NORTH = 'N'.freeze
	SOUTH = 'S'.freeze

	def initialize
		@route = []
	end

	def delivery_instructions(area, drops)
		start = Point.new(0, 0)
		drops.each do |drop|
			return 'Cant drop outside route' unless drop.valid_drop?(area)
			deliver(start, drop)
			@route << DROP
			start = drop
		end
		@route.join
	end

		private

	def deliver(start, drop)
		find_lat_diff(start.lat, drop.lat)
		find_long_diff(start.long, drop.long)
	end

	def find_lat_diff(start, drop)
		drop >= start ? @route << format_delivery(NORTH, drop - start) : @route << format_delivery(SOUTH, start - drop)
	end

	def find_long_diff(start, drop)
		drop >= start ? @route << format_delivery(EAST, drop - start) : @route << format_delivery(WEST, start - drop)
	end

	def format_delivery(direction, num)
		direction * num
	end
end
