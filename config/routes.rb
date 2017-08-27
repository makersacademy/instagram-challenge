Rails.application.routes.draw do
  devise_for :users

  resources :photos do
    resources :comments
    resources :likes
  end

  resources :feed
  resources :profiles
  resources :followers

  root 'photos#index'
end
