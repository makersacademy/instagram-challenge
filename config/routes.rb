Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/feed", to: "pics#index"
  get "/pics/new", to: "pics#new"

  root "users#new"
end
