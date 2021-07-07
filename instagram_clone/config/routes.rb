Rails.application.routes.draw do
  resources :followers
  resources :comments
  resources :posts
  resources :insta
  root to: 'pages#home'

  post '/comments/create', to: 'comments#create'
  post '/followers/create', to: 'followers#create'
  devise_for :users, :controllers => {:registrations => 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end