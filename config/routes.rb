# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  resources :posts do
    member do
      post 'comment'
      post 'like'
    end
  end
  resources :comments do
    member do
      post 'comment'
      post 'like'
    end
  end
end
