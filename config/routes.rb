Rails.application.routes.draw do

  root to: 'players#home'

  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  resources :games do
    member do
      get :delete
    end
  end

  resources :players do
    member do
      get :delete
      get :home
    end
  end

  resources :participations do
    member do
      get :delete
      get :games
      get :playerParticipations
    end
  end

  
  
  get 'participations/new/:id/:player_id', to: 'participations#new' #this is incredibly janky, figure out how to do this not badly


  get ':controller(/:action(/:id))'

  resources :players
  resources :games
  resources :participations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end