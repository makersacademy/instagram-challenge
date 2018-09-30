Rails.application.routes.draw do
  devise_for :users
  get 'pictures/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "pictures#index"
end
