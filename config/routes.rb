Rails.application.routes.draw do
  get 'home/index'

  root "home#index"

  resources :users, :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
