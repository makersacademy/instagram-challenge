# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments do
    end
  end

  resources :posts do
    resource :likes do
    end
  end

  root 'posts#index'

end
