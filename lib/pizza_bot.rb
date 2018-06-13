class Pizzabot
	DROP = "D"
	EAST = "E"
	WEST = "W"
	NORTH = "N"
	SOUTH = "S"

	def initialize(route: [])
		@route = route
	end

	def delivery_instructions(area, drops)
		start = Point.new(0,0)
		drops.each do |drop|
			return "Cant drop outside route" unless is_valid_drop?(area,drop)
			deliver(start,drop)
			@route << DROP
			start = drop
		end
		@route.join
	end

	private

	def deliver(start,drop)
		find_long_diff(start.long,drop.long)
		find_lat_diff(start.lat,drop.lat)
	end

	def find_lat_diff(start,drop)
		drop >= start ? @route << format_delivery(NORTH,drop-start) : @route << format_delivery(SOUTH,start-drop)
	end

	def find_long_diff(start,drop)
		drop >= start ? @route << format_delivery(EAST,drop-start) : @route << format_delivery(WEST,start-drop)
	end

	def format_delivery(direction,num)
		direction * num
	end

	def is_valid_drop?(area,drop)
		area.lat >= drop.lat && area.long >= drop.long
	end
end