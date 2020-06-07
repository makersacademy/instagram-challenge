Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :posts
  get '/dashboard' => "accounts#index"
  get 'profile/:username' => "accounts#profile", as: :profile
  get "post/like/:post_id" => "likes#save_like", as: :like_post
  resources :posts, only: [:new, :create, :show]
  root to: 'public#homepage'

end
