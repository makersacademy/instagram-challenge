Rails.application.routes.draw do

  devise_for :user

  get 'welcome/index'

  root 'posts#index'

  resources :posts
end
