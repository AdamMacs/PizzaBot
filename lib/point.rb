class Point
  attr_accessor :lat, :long

  def initialize(long, lat)
    @long = long
    @lat = lat
  end

  def valid_drop?(area)
    area.long >= @long && area.lat >= @lat
  end
end
