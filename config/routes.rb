Rails.application.routes.draw do

  root to: "posts#index"

  resources :users do
    resources :posts
  end
  
end
