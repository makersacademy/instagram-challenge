Rails.application.routes.draw do
  root 'grams#index'

  resources :grams
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'grams/index'
  # get 'grams/new'
  # get 'grams/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
