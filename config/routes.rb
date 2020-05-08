Rails.application.routes.draw do
  get 'sessions/index'
  resources :sessions
  resources :users, only: [:new, :create]
end
