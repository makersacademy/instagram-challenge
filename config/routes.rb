Rails.application.routes.draw do
  resources :posts
  get 'posts' => 'posts#index'

  resources :posts do
    resources :comments
  end
end
