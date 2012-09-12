class SearchController < ApplicationController
  #GET /search
  def index 
    # TODO: Migrate to ES
    @noun = Noun.find_by(name: params[:noun])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end