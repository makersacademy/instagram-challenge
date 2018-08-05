Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :images

  root 'welcome#index'
end
