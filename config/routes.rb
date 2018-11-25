Rails.application.routes.draw do
  get 'photo/new'
  get 'photo/index'
  get 'photo/store'
  post 'photo/store'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
