Catalogs::Application.routes.draw do

  root :to => 'home#index'

  resources :cities
  resources :locations
  resources :answers
  resources :search
  resources :nouns do
    resources :cities, :controller => 'nouns/cities', :only => [:index, :show]
  end

  devise_for :users

end
