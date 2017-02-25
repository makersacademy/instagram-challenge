Rails.application.routes.draw do

  get "posts" => 'posts#index'

  devise_for :users

  resources :posts do
    resources :comments
  end
end
