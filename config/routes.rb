Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  get 'posts/:id/comment', to: 'posts#comment', as: :comment_post
  patch 'posts/:id', to: 'posts#update'
  get 'posts/:id', to: 'posts#show', as: :post
  post 'posts', to: 'posts#create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

end
