Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    #dashboard
    get "/dashboard" => "users#index"

    resources :posts, only: [:new, :create, :show]

  root to: "public#index"
end
