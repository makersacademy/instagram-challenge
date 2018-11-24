# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  # devise_for :models
  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: "photo#index"

  resources :photos
end
