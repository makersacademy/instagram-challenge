Rails.application.routes.draw do
  devise_for :users

  resources :photos do
    resources :comments
  end
  resources :profiles

  root 'photos#index'
end
