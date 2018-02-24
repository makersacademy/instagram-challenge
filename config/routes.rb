Rails.application.routes.draw do
  resources :posts
  get 'home/index'

  root 'posts#index'

  devise_for :users

  resources :users do
    resources :posts
  end
end
