Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]

  root to: 'home#index'
end
