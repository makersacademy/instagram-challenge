Rails.application.routes.draw do
  get 'home/index'

  root 'posts#index'

  devise_for :users

  resources :posts do
    resources :comments
  end
end
