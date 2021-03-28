Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users
  get 'home/index'
  root 'home#index'
  
end
