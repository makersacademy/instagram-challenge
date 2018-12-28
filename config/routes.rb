Rails.application.routes.draw do
  root "posts#index"
  get "sign_in" => "sessions#new", :as => "sign_in"
  get "posts" => "posts#index", :as => "posts"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  resources :sessions
end
