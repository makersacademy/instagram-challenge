Rails.application.routes.draw do
  get 'posts/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :likes, :comments
  end

  root to: "posts#index"

end
