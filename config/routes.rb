Rails.application.routes.draw do
  get 'users/show'
  root 'pages#home'

  devise_for :users
  # controllers: {registrations: registrations}
  resources :users, only: [:show]
  resources :posts, only: [:index, :show, :create] do
    resources :photos, only: [:create]
  end
end
