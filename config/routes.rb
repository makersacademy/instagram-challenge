Rails.application.routes.draw do
  get 'welcome/index'
  # devise_for :users
  root to: 'welcome#index'

  resources :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
