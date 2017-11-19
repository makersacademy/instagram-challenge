# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'

  devise_for :users
  resources :posts

  resources :posts do
    resources :comments
  end

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
