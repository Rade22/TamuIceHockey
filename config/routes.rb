Rails.application.routes.draw do
  root 'players#index'

  resources :games do
    member do
      get :delete
    end
  end

  resources :players do
    member do
      get :delete
      get :pickGame
    end
  end

  get ':controller(/:action(/:id))'

  resources :players
  resources :games

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
