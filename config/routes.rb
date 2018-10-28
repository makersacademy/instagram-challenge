Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
