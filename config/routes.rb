Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :posts do
    resources :comments
    resources :likes
  end

  root "posts#index"

end
