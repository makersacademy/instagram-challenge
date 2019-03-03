# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
      registrations: 'registrations',
      sessions: 'users/sessions'
  }
  # root to: 'home#index'
  root to: 'posts#index'
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
