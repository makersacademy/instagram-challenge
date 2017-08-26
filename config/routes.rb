Rails.application.routes.draw do
  devise_for :users

  resources :photos do
    resources :comments
    resources :likes
  end
  resources :profiles

  root 'photos#index'
end
