Rails.application.routes.draw do

  devise_for :users
  resources :images

  root to: 'images#index'
end
