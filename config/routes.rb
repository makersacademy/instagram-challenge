Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :photo
  resources :photo do
    resources :comment, only: [:index, :new, :create, :destroy, :update]
    resources :like, only: [:index, :new, :create, :destroy]
  end
  root to: 'photo#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
