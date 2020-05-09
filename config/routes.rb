Rails.application.routes.draw do
  devise_for :users
  get 'instagram/index'
  resources :users
  resources :posts, only: [:new, :create]
  root 'instagram#index'
end
