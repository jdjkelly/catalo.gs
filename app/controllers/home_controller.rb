class HomeController < ActionController::Base
  # GET /home
  def index
    render :layout => 'application'
  end

end