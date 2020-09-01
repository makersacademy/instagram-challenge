Rails.application.routes.draw do
  devise_for :users

  resources :posts
  
  get "/dashboard" => 'users#index'

  root to: "public#homepage"
end

