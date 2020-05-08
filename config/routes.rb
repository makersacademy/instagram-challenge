Rails.application.routes.draw do
  resources :sessions
  resources :users, only: [:new, :create]
  root 'sessions#index'
end
