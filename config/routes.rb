Rails.application.routes.draw do
  root 'players#index'
  get 'players/createPlayer'
  get 'players/playerInputStats'
  get 'games/createGame'
  get 'games/gameInputStats'
  
  resources :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
