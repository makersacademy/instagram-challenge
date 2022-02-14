Rails.application.routes.draw do
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

    get "/dashboard" => "accounts#index"
    get "profile/:username" => "accounts#profile"

    resources :posts, only: [:new,:create,:show]

    root "public#homepage" #controller name 'public' and a method name 'homepage'
end