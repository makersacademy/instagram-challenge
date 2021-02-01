Rails.application.routes.draw do
  root "users#new"

  resources :posts 
  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
end
