Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'users/new', to: 'users#new'

  root 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
