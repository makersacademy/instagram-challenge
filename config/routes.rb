Rails.application.routes.draw do
  resources :users
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions


  get "signup", to: "users#new", as: "signup"
end
