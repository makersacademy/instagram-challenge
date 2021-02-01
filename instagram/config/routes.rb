Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :sessions
  resources :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
