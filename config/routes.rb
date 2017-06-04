Rails.application.routes.draw do
  get 'comments/new'
  devise_for :user
  root 'posts#index'
  resources :posts, :likes, :comments
end
