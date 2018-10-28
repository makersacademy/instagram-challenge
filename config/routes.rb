# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :messages, only: :index do
    resources :comments
  end

  resources :users do
    resources :messages
    get '/', to: 'messages#profile'
  end

  authenticated :user do
    root to: 'messages#index'
  end

  root to: redirect('/users/sign_in')
end
