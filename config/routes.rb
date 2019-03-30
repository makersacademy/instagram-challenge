Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
end
