Rails.application.routes.draw do

  root "pictures#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pictures do
    resources :comments
  end






end
