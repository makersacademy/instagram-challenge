Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :images
  resources :comments

  match :like, to: 'likes#create', as: :like, via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
