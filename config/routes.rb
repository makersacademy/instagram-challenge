Rails.application.routes.draw do
  root 'posts#index'
  get 'posts' => "posts#index", :as => "posts"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
end
