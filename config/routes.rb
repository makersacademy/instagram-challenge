Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :users
  resources :sessions
  resources :posts

  root 'sessions#index'

  post 'users/new' => 'users#create'

  post 'sessions/new' => 'sessions#create'

  post 'posts/new' => 'posts#create'

  post 'likes/:id' => 'likes#create'
end
