Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:new, :create, :show, :destroy]
end
