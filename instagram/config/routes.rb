Rails.application.routes.draw do
  root "welcome#index"
  get "/", to: "welcome#index"
  get "signup", to: "users#new"
  get "edit", to: "users#edit"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "posts", to: "posts#index"
  get "posts/new", to: "posts#new"
  post "posts", to: "posts#create"
  resources :users
  resources :posts
end
