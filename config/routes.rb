Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  root to: "posts#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
