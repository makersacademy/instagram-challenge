Rails.application.routes.draw do

  devise_for :users
  resources :photos
  root to: 'dashboard#index'
end
