Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :posts
end
