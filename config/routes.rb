Rails.application.routes.draw do
  devise_for :users
  get 'post/index'
  get 'post/new'
  get 'post/create'
  post 'post/create'
  get 'home/index'
  post '/like_post' => 'post#like', as: "like_post"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
