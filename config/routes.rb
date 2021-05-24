Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "signup", to: "users#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  put "/post/:id/like", to: "posts#like", as: "like"

  resources :posts
  resources :users
  resources :comments
end
