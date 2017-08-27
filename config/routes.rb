Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pictures' => 'pictures#index'
  resources :pictures
  resources :posts
  resources :users
  root 'posts#index'
end
