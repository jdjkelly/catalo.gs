class Nouns::CitiesController < ApplicationController
  # GET /nouns/1/cities
  # GET /nouns/1/cities.json
  def index
    @cities = Noun.find(params[:noun]).cities

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cities }
    end
  end

  # GET /nouns/1/cities/1
  # GET /nouns/1/cities/1.json
  def show
    @answers = Answer.where(city: params[:id], noun: params[:noun])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city }
    end
  end
end
