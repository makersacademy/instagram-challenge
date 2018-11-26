Rails.application.routes.draw do
  get 'users/show'
  root 'pages#home'

  devise_for :users
  # controllers: {registrations: registrations}
  resources :users, only: [:show]
end
