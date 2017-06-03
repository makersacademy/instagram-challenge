Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # get 'welcome#route'
  
  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
