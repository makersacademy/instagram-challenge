# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    root to: 'landing#landing', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  resources :grams
  get 'my_grams', to: 'grams#users_grams'
end
