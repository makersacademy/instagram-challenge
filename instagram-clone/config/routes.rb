Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :posts

  root 'sessions#index'

  post 'users/new' => 'users#create'
end
