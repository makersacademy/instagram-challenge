Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :likes
    resources :comments
  end
end
