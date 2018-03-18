Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  resources :pictures

  root 'pictures#index'
end
