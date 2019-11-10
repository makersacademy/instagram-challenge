# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :posts, :comments

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  root to: "posts#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
