# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'landing#landing'

  resources :grams
  get 'my_grams', to: 'grams#users_grams'
end
