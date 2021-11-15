Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "/dashboard" => "accounts#index"

  # get "/accounts/sign_out" => "public#homepage"

  resources :posts, only: [:new, :create, :show]

  resources :comments, only: [:create]


  root to: "public#homepage"
end
