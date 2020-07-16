Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :posts do
    resources :comments
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
