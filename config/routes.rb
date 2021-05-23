Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root "posts#index"
  resources :users
  post "/users/:id", to: "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
