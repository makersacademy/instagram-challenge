Rails.application.routes.draw do

  root 'sessions#login'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'

  resources :users do
    resources :post
  end

end