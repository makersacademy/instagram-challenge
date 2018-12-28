Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/destroy'
  root 'posts#index'
  get 'posts' => "posts#index", :as => "posts"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
end
