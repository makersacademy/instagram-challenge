Rails.application.routes.draw do
  get 'welcome/index'

  resources :users

  root 'welcome#index'
end
