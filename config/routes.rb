Rails.application.routes.draw do
  root to: "welcome#index"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create", as: 'log_in'
  get "logout", to: "sessions#destroy"
  post "logout", to: "sessions#destroy" 
  get "profile", to: "users#profile"
  get "update-profile", to: "registrations#edit"
  patch "update-profile", to: "registrations#update"

  resources :posts
end
