Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :photo
  resources :photo do
    resources :comment, only: [:index, :new, :create, :destroy, :update]
  end
  root to: 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
