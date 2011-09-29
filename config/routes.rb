Frenzy::Application.routes.draw do
  root :to => 'questions#index'
  devise_for :users
  resources :questions do
    collection do
      get "free"
    end
    member do
      get "vote_for"
      get "vote_against"
    end
  end
  resources :answers do
  end
  
  resources :users, :only => [:show]
end
