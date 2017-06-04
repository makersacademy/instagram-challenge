Rails.application.routes.draw do
  root '_posts#index'
  resources :posts
  devise_for :users
  # devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
