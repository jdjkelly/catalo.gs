Catalogs::Application.routes.draw do

  root :to => 'home#index'

  resources :answers
  resources :cities
  resources :locations
  resources :nouns do
    resources :cities, :controller => 'nouns/cities', :only => [:index, :show]
  end
  resources :search
  resources :users

  devise_for :users

end
