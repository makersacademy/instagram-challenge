Rails.application.routes.draw do
  resources :pets
  devise_for :users
  get 'homepage/index'
  resources :pictures do
    resources :comments
  end
  root 'homepage#index'
end
