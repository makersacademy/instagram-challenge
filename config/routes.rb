Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'posts' => 'posts#index'
  root to: "posts#index"

  resources :posts do
    resources :comments
  end
end
