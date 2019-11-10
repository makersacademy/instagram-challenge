Rails.application.routes.draw do
  resources :pics do
    member do
      put "like", to: "pics#upvote"
      put "unlike", to: "pics#downvote"
    end
  end
  devise_for :users
  get 'home/index'

  root to: 'home#index'
end
