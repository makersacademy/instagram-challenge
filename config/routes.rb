Rails.application.routes.draw do
  devise_for :users

  root to: "pictures#index"

  resources :pictures do
    resources :likes
    resources :comments
  end
end
