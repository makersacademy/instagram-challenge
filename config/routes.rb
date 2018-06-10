Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts do
    member do
      put "like" => "posts#upvote"
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
