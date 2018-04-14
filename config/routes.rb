# frozen_string_literal: true

Rails.application.routes.draw do
  resources :photos do
    resources :comments, :likes
  end

  resources :users

  root 'welcome#index'
end
