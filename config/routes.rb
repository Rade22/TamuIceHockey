Rails.application.routes.draw do
  root 'players#index'
  
  #get 'players/createPlayer'
  #get 'players/playerInputStats'
  #get 'players/choosePlayer'

  #get 'games/createGame'
  #get 'games/gameInputStats'
  #get 'games/chooseGame'
  
  #post 'games/createGame'
  resources :players
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
