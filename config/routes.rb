Rails.application.routes.draw do

  devise_for :users #, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "posts#index"

  resources :users do
    resources :posts
  end
  
end
