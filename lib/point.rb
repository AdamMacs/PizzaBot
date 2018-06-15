class Point
  attr_accessor :lat, :long

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def valid_drop?(area)
    area.lat >= @lat && area.long >= @long
  end
end
