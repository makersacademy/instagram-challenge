Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
