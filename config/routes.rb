Rails.application.routes.draw do
  get 'photos' => 'photos#index'
  resources :photos, only: [:new, :create, :index, :destroy]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'photos#index'
end
