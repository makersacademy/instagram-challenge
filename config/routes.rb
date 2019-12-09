Rails.application.routes.draw do
  get 'binstagram/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  resources :posts
  resources :users
  resources :sessions

  root 'binstagram#index'
end
