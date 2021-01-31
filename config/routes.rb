Rails.application.routes.draw do
  root "users#new"

  resources :posts 
  resources :users
end
