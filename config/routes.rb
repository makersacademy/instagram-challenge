Rails.application.routes.draw do
  resources :posts, :users

  get "register", to: "users#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  root to: "sessions#new"
end
