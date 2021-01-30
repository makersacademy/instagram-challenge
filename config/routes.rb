Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  namespace :post do
    resources :comments
  end
  resources :comments
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
end
