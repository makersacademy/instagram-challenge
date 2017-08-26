Rails.application.routes.draw do

  get 'welcome/index'

  resources :photos

  root 'welcome#index'
end
