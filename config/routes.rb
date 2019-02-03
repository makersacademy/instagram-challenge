Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  get '/home', to: 'posts#home'

  resources :posts

  resources :users, only: [:show]
  # root 'posts#home'
end
