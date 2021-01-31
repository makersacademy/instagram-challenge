Rails.application.routes.draw do
  resources :images do
    resources :tweetts
  end
  namespace :image do
    resources :tweetts
  end
  resources :posts do
    resources :comments
  end
  namespace :post do
    resources :comments
  end
  resources :comments
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "images#index"
  resources :sessions, only: [:new, :create, :destroy]

  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
end
