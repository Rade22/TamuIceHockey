Rails.application.routes.draw do
  root 'players#index'

  get "/games/delete/:id", to: "games#delete"

  resources :players
  resources :games

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
