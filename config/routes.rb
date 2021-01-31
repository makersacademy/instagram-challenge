Rails.application.routes.draw do

  get 'comments/new'
  get 'likes/new'
  root "sessions#new"

  resources :pictures

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  post 'like' => 'likes#create'
  post 'comment' => 'comments#create'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
