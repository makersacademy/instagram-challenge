Rails.application.routes.draw do
  devise_for :grammas
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :feed
  resources :images

  post 'feed/like_image'
end
