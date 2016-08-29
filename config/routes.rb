Rails.application.routes.draw do
  get 'images' => 'images#index'
  resources :images, only: [:new, :create, :index, :destroy]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'images#index'
end
