# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'landing_page#index'
  get 'users/:id' => 'users#show'

  resources :posts
  resources :users, only: [:show]
end
