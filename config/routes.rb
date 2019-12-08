Rails.application.routes.draw do
  get 'binstagram/index'

  resources :posts
  resources :users

  root 'binstagram#index'
end
