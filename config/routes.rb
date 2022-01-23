Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "homepage", to: "homepage#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "main#index"
  post "sign_in", to: "main#create"

  delete "logout", to: "sessions#destroy"

  root to: "main#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
