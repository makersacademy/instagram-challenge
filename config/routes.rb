Rails.application.routes.draw do
  

  # post "post_likes", to: "posts_likes#create"
  resources :post_likes, only: [:create]
  resources :posts, only: [:new, :create, :index]
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
