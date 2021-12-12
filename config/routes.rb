Rails.application.routes.draw do
  root 'pictures#index'
  get 'pictures/index', to: 'pictures#index'
  get 'pictures', to: 'pictures#index'
  get 'pictures/create', to: 'pictures#new'
  post 'pictures/create', to: 'pictures#create'
  resources :pictures
  
  # For details one DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
