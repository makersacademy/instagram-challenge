Rails.application.routes.draw do
  resource :sessions
  resources :users, only: [:new, :create]
  root 'sessions#index'
end
