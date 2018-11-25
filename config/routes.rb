Rails.application.routes.draw do
  mount Commontator::Engine => '/commontator'
  get 'post/new'
  get 'post/index'
  post 'post/store'
  root to: 'post#index'
  devise_for :users
  resources :users
  resources :posts do
    put "like", to: "post#upvote"
    put "dislike", to: "post#downvote"
  end
end
