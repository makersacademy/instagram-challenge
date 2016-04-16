Rails.application.routes.draw do
  devise_for :users
  root 'images#index'
  resources :images
end
