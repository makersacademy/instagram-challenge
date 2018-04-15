# frozen_string_literal: true

Rails.application.routes.draw do
  resources :photos do
    resources :likes
  end

  resources :users

  root 'photos#index'
end
