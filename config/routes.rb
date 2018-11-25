Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'homepage/index'
  root 'homepage#index'
end
