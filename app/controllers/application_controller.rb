class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :city
  helper_method :coordinates
  helper_method :latitude
  helper_method :longitude

  def coordinates
    if request.location.coordinates == [0.0, 0.0] 
      [-79.385324, 43.648560]
    else
      [request.location.coordinates.last, request.location.coordinates.first]
    end
  end

  def latitude
    coordinates.last
  end

  def longitude 
    coordinates.first
  end

  def city 
    request.location.city.present? ? request.location.city : "Toronto"
  end

end
