Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts

  root 'welcome#index'
end
