Rails.application.routes.draw do
  root "posts#index"
  get "sign_up" => "users#new", :as => "sign_up"
  get "sign_in" => "sessions#new", :as => "sign_in"
  get "sign_out" => "sessions#destroy", :as => "sign_out"
  get "posts" => "posts#index", :as => "posts"
  resources :users
  resources :sessions
end
