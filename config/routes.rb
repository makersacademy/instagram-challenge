Rails.application.routes.draw do
  resources :pics
  devise_for :users
  get 'home/index'

  root to: 'home#index'
end
