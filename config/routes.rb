Rails.application.routes.draw do
  get 'pictures/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "pictures#index"
end
