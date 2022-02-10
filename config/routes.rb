Rails.application.routes.draw do
  devise_for :users
  root 'pictures#index'
  resources :pictures

  get '/users/new', to: 'users#new'
  
  # For details one DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
