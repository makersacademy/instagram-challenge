Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'posts/edit'
  get 'posts/like'
  get 'posts/dislike'

  resources :posts

  root to: 'home#index'
end
