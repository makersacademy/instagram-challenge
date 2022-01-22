Rails.application.routes.draw do
  root "posts#index"

  resources :posts
  # get "/posts", to: "posts#index"
  # get "/posts/:id", to: "posts#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
