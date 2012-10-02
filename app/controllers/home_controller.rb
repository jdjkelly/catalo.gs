class HomeController < ApplicationController
  # GET /home
  def index    
    @noun = Noun.offset(rand(Noun.count)).first
  end

  # POST /home
  # POST /home.json
  def create
    session[:city] = params[:city]
  end
end