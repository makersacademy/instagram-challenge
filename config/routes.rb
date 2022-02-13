Rails.application.routes.draw do
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

    get "/dashboard" => "accounts#index"
    
    root "public#homepage" #controller name 'public' and a method name 'homepage'
end