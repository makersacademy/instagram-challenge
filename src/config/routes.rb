Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :pictures
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
  root "welcome#index"


  get "/users/new", to: "users#new"
  post "/users", to: "users#create"
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'
  get 'homepage/index'
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
