Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :posts

  root 'sessions#index'

  post 'users/new' => 'users#create'

  post 'sessions/new' => 'sessions#create'

  post 'posts/new' => 'posts#create'
end
