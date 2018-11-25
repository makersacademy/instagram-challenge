Rails.application.routes.draw do
  devise_for :users
  get 'homepage/index'
  root 'homepage#index'
  resources :posts, :shallow => true do
    resources :comments
  end
end
