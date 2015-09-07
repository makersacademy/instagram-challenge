Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  get "home" => "home#index"
  resources :photos do
    resources :comments
    resources :likes
  end
  resources :users
end
