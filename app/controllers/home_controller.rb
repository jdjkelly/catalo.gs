class HomeController < ApplicationController
  # GET /home
  def index
    session[:city] = "Toronto"
    
    @noun = Noun.offset(rand(Noun.count)).first
    @location = Location.last
    @featured_image = @location.location_images.where(type: "featured").first
  end

  # POST /home
  # POST /home.json
  def create
    session[:city] = params[:city]
  end
end