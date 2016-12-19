Rails.application.routes.draw do
  devise_for :users
  resources :images do
    resources :likes
    resources :comments
  end
  root "images#index"
  get 'images' => 'images#index'
end
