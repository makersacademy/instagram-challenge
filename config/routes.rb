Rails.application.routes.draw do

  devise_for :users

  resources :pictures do
  	resources :comments
  	resources :likes
  end

  root to: "pictures#index"

end
