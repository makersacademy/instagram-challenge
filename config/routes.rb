Rails.application.routes.draw do
  devise_for :users 
  resources :posts do
  resources :comments
end


  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root 'welcome#index'
end
