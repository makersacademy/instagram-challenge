Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'posts#index'
  resources :posts do
    resources :comments
  end
end
