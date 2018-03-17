Rails.application.routes.draw do
  get 'welcome/index'

  resources :picture

  root 'welcome#index'
end
