Rails.application.routes.draw do
  resources :posts
  devise_for :users

  root to: "posts#index"
  post '/like_post' => 'posts#like', as: "like_post"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
