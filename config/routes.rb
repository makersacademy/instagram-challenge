Rails.application.routes.draw do
  resources :posts do
    resources :comments do
    end
  end
  devise_for :users
  root to: 'home#front'

  post '/posts/:post_id/like', to: 'likes#like', as: 'like_post'
  post '/posts/:post_id/unlike', to: 'likes#unlike', as: 'unlike_post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
