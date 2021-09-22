Rails.application.routes.draw do
  root 'posts#index'

  resources :comments
  resources :friendships
  resources :posts
  resources :users do resources :posts end

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  post 'like_post', to: 'likes#create'
  delete 'unlike_post', to: 'likes#destroy'
  post 'add_friend', to: 'friendships#create'
  delete 'remove_friend', to: 'friendships#destroy'
end
