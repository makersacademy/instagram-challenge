Rails.application.routes.draw do
  devise_for :accounts
  get "/dashboard" => "accounts#index"
  resources :posts, only: [:new, :create, :show]
  root to: "public#homepage"
  # root to: "accounts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
