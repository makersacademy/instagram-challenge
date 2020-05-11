Rails.application.routes.draw do
  get 'sessions/new' 
  post  'sessions/new', to: 'sessions#create'
  get 'users/new'
  post 'users/new'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
