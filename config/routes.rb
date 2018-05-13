Rails.application.routes.draw do
  devise_for :users
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "photos#index"
end
