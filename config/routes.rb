Rails.application.routes.draw do
  get 'binstagram/index'

  resources :posts

  root 'binstagram#index'
end
