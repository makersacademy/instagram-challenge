# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :likes, only: [:new]
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
