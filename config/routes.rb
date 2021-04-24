Rails.application.routes.draw do
  resources :users, only: [:new, :create]
     get 'login', to: 'sessions#new'
     post 'login', to: 'sessions#create'
     get 'welcome', to: 'sessions#welcome'
end
