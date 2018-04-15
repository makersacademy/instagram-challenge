Rails.application.routes.draw do
  get 'comments/create'

  devise_for :users
  resources :posts

  root to: "posts#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
