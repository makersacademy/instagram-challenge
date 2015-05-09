Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :posts do
    resources :comments
  end
end
