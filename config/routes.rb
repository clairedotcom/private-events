Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events
  resources :users, only: [:show]
  resources :signups
end
