Rails.application.routes.draw do
  
  devise_for :user

  get 'welcome/index'

  root 'welcome#index'
end
