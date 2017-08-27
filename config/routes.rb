Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  # devise_for :users
  # resources :users
end
