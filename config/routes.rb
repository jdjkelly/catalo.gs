Catalogs::Application.routes.draw do

  root :to => 'home#index'

  devise_for :users

  resources :answers do
    resource :vote, :only => ['create', 'destroy'], :controller => 'answers/vote'
  end
  resources :locations
  resources :nouns
  resources :search
  resources :users, :only => 'show'

end
