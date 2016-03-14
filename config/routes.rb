Rails.application.routes.draw do

  resources :hipstergrams do
    resources :likes_before_cool
  end

  devise_for :hipsters, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root to: "hipstergrams#index"

  
end
