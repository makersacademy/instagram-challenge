Rails.application.routes.draw do

  # devise_for :users
  resources :images do
    resources :comments
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "images#index"

end
