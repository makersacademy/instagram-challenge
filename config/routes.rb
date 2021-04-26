Rails.application.routes.draw do

  root 'sessions#welcome'

  resources :sessions, only: [:new, :create,:welcome, :destroy]
  resources :users, only: [:new, :create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'newpost', to: 'posts#new', as: 'newpost'
  post'newpost', to: 'posts#create'


end
