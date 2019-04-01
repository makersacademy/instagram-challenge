Rails.application.routes.draw do
  devise_for :users
  get 'pictures/index'

  resources :posts

  root 'pictures#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
