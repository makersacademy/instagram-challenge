Rails.application.routes.draw do
  resources :pics do
    member do
      put "like", to: "pics#upvote"
      put "unlike", to: "pics#downvote"
    end
    resources :comments
  end
  devise_for :users
  get 'home/index'
  post 'comments' => 'comments#create', as: "create_comment"

  root to: 'home#index'
end
