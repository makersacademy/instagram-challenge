Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "posts#index"

  resources :users

  resources :posts, shallow: true do
    resources :comments do
      resources :upvotes
    end
  end

end
