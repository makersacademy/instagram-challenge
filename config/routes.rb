Rails.application.routes.draw do

  get 'comments/new'

  devise_for :user

  get 'welcome/index'

  root 'posts#index'

  resources :posts, :likes, :comments
end
