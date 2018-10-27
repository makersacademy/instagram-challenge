# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'landing_page#index'
  get 'users/:id' => 'users#show'
  get 'posts/:id/likes', to: 'posts#likes', as: :likes
  get 'users/:id/follow', to: 'users#follow', as: :follow
  resources :posts
  resources :users, only: [:show]
end
