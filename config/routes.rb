Rails.application.routes.draw do
  get 'participations/new'
  get 'participations/create'
  get 'participations/update'
  get 'participations/edit'
  get 'participations/destroy'
  get 'participations/index'
  get 'participations/show'
  root 'players#index'

  resources :games do
    member do
      get :delete
    end
  end

  resources :players do
    member do
      get :delete
    end
  end

  resources :participations do
    member do
      get :delete
    end
  end




  get ':controller(/:action(/:id))'

  resources :players
  resources :games
  resources :participations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
