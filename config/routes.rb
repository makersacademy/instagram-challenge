# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'landing_page#index'

  resources :posts
end
