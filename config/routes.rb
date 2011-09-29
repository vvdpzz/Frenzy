Frenzy::Application.routes.draw do
  root :to => 'questions#index'
  devise_for :users
  resources :questions do
    collection do
      get "free"
    end
  end
end
