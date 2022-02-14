Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  
  root 'events#index'
  
  resources :events do
    member do
      get 'attend'
      get 'unattend'
    end
  end
  
  resources :users, only: [:show]
  resources :signups
end
