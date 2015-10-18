Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "posts#index"

  resources :users

  resources :posts do
    resources :comments
  end

end
