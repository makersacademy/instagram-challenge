Rails.application.routes.draw do
  devise_for :users
  resources :images do
    resources :likes
  end
  root "images#index"
  get 'images' => 'images#index'
end
