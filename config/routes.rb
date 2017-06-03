Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :users, :pictures

  root 'welcome#index'

end
