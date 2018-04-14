# frozen_string_literal: true

Rails.application.routes.draw do
  resources :photos
  resources :users
  root 'welcome#index'
end
