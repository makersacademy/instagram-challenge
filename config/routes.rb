Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "pictures#index"
  resources :pictures


end
