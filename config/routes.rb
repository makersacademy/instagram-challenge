Rails.application.routes.draw do
  devise_for :users
  resources :grams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'grams#index'
end
