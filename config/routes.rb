Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'
  get 'search' => 'search#index'
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]

end
