Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  root 'posts#index'
end
