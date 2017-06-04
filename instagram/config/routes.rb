Rails.application.routes.draw do
  resources :photos
  devise_for :users
  root 'user#index'

  match :like, to: 'likes#create', as: :like, via: :post
end
