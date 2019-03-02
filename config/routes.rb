# frozen_string_literal: true

Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :resources
  resources :posts
  resources :follows
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
