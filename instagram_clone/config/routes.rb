Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pictures, only: [:new, :create, :index, :destroy]

  root "pictures#index"
end
