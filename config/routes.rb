Rails.application.routes.draw do
  
  root 'pictures#index'
  resources :pictures
  devise_for :users do 
    resources :pictures
  end
  
  # For details one DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
