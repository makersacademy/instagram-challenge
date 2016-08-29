Rails.application.routes.draw do
  # get 'posts' => 'posts#index'
  resources :posts, only: [:new, :create, :index, :destroy]
  root to: 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
