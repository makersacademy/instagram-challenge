Rails.application.routes.draw do
  get "users", to: "users#new"
  post "users", to: "users#create"
  root to: "users#new"
end
