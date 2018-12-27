Rails.application.routes.draw do
  get 'posts/index'
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => 'posts#index'
  resources :users
end
