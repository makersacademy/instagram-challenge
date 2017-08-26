Rails.application.routes.draw do
  devise_for :users

  resources :photos
  resources :profiles

  root 'photos#index'
end
