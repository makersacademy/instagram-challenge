Rails.application.routes.draw do
  devise_for :users
  root to: 'pictures#index'
  resources :pictures, only: [:index, :show, :new, :create], shallow: true do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
