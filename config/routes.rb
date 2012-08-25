Better::Application.routes.draw do

  root :to => 'home#index'

  resources :cities
  resources :locations
  resources :answers
  resources :nouns do
    resources :cities, :controller => 'nouns/cities', :only => [:index, :show]
  end

end
