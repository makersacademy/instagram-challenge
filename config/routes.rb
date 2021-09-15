Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users

  root 'posts#index'
  
end
