Rails.application.routes.draw do
  root "welcome#index"
  get "/", to: "welcome#index"
  get "signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resources:users
end
