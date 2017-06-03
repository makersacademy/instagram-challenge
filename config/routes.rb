Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :users

  root 'welcome#index'

end
