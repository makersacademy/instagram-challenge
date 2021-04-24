Rails.application.routes.draw do
  root 'sessions#welcome'

  resources :sessions, only: [:new, :create, :login, :welcome]
  resources :users, only: [:new, :create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

end
