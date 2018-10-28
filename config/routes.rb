# frozen_string_literal: true

Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users
  resources :users do
   member do
     get :following, :followers
   end
 end
  get 'welcome/index'
  root 'welcome#index'
  get ':username', to: 'profiles#show', as: :profile
  get ':username/edit', to: 'profiles#edit', as: :edit_profile
  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resources :comments
    resources :likes
  end
end
