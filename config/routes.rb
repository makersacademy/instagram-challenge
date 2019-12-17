# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :posts do
    resources :comments
    resources :likes, only: [:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
