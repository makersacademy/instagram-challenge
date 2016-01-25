Rails.application.routes.draw do
  resources :photos
  root to: "photos#index"

  devise_for :users
end
