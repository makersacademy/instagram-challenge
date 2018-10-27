# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :message, only: :index

  resources :users do
    get '/', to: 'message#profile'
    resources :message
  end

  authenticated :user do
    root to: 'message#index'
  end

  root to: redirect('/users/sign_in')
end
