Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]
  get 'home/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
