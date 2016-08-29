Rails.application.routes.draw do
  # get 'photos' => 'photos#index'
  resources :photos, only: [:new, :create, :index, :destroy]
  root to: 'photos#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
