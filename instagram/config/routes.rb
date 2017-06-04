Rails.application.routes.draw do
  devise_for :users
  root 'user#index'

  match :like, to: 'likes#create', as: :like, via: :post

  resources :photos do
    resources :comments
  end
end
