Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pictures, only:[:index, :new, :create, :show]
  root to: 'pictures#index'
end
