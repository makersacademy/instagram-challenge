Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard' => 'accounts#index'
  root to: "public#index"
  resources :posts, only: [:new, :create, :show]
end
