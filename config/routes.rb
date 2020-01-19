Rails.application.routes.draw do
  resources :comments
  resources :fatcats
  resources :likes, controller: "likes", only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  

  root 'fatcats#index'
end
