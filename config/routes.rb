Rails.application.routes.draw do
  resources :posts
  get 'posts/new'
  post 'posts/create'

  resources :users
  get 'users/new'
  post 'users/create'
  root "users#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#the "posts#index route sets the base root as posts"
