Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :posts

  root 'welcome#index'
end
