module Geolib

  def latitude
    self.coordinates.last
  end

  def longitude
    self.coordinates.first
  end

end