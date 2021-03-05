Rails.application.routes.draw do

  resources :comments
  get 'posts/index'
  devise_for :users
  root to: "posts#index"

  resources "posts"
  resources "comments"

end
