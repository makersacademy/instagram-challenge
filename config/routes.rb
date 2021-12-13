Rails.application.routes.draw do
  root 'pictures#index'
  resources :pictures
  
  # For details one DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
