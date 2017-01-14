Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "photos#index"
  resources :photos do
    resources :comments
  end
end
