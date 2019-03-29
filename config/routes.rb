Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts
  devise_for :users
end
