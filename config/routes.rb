# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
end
