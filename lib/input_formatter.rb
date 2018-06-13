Class InputFormatter
  attr_reader :grid, :drops
  
  def initialize(input)
  @grid = format_grid
  @drops = format_drops(input)
  end 
  
  def format_input(input)
  	grid_size_array = input.scan(/\d\w\d/).first.split("x")
	max_long,max_lat = grid_size_array[0].to_i,grid_size_array[1].to_i
	Point.new(max_long,max_lat)
  end
  
  def format_drops(input)
  	drops = []
  	drop_offs = input.scan(/-?\d+,\s?-?\d+/)
		 drop_offs.each do |drop_off|
      		long =  drop_off.split(",").first.to_i
      		lat = drop_off.split(",").last.to_i
      		drops << Point.new(long, lat)
    	end
    	drops
	end
  
