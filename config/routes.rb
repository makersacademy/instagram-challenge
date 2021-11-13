Rails.application.routes.draw do
  resources :likes
  resources :posts
  devise_for :users
  root 'home#index'
end
