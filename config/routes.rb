Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'images#index'
  resources :images do
    resources :comments
    member do
      put "like", to: "images#upvote"
      put "dislike", to: "images#downvotes"
    end
  end
end
