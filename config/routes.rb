Rails.application.routes.draw do
get	'/posts/new', to: 'posts#new'
  get '/posts/:id', to: 'posts#show'

  devise_for :users
  get 'home/index'
  root to: 'home#index'
  #the below tells Rails to map requests to http://localhost:3000/users/:id to the user controller's show action, with :id is ID of current user. If ID of current user is 1, path point to user profile page is http://localhost:3000/users/1
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
