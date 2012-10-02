class SearchController < ApplicationController
  #GET /search
  def index 
    # TODO: Migrate to ES
    @noun = Noun.find_by(name: params[:noun])

    redirect_to @noun
    
  end

end