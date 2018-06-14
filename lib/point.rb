class Point
  attr_accessor :long, :lat

  def initialize(long, lat)
    @long = long
    @lat = lat
  end

  def valid_drop?(area)
    area.lat >= @lat && area.long >= @long
  end

end
