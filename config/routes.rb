Rails.application.routes.draw do
  get 'images' => 'images#index'
  resources :images do
    resource :comments
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'images#index'
end
