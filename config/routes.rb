Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :home
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]

  get 'search/index'
  get 'search' => 'search#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
