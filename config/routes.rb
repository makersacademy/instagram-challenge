Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :posts
  devise_for :users
  root 'home#index'
end
