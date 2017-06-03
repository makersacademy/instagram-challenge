Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: "profiles#index"
  resources :profiles do
    resources :posts
  end
end
