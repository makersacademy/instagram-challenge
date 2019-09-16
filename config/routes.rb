# frozen_string_literal: true

Rails.application.routes.draw do
  resources :photos
  root "posts#index"

  devise_for :users

  resources :users do
    resources :posts
  end
end
