Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :posts
  #resources :users

  root 'welcome#index'
end
