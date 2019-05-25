Rails.application.routes.draw do
  root "welcome#index"
  get "signup", to: "users#new"
  get "/", to: "welcome#index"
  resources:users
end
