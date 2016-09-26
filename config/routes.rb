Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
  end
end
