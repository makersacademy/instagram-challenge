Rails.application.routes.draw do
  resource :sessions, only: [:index, :new, :create, :destroy]
  resources :users, only: [:new, :create]
  root 'sessions#index'
end
