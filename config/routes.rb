Rails.application.routes.draw do
  get 'picture/index'
  resources :pictures

  root 'picture#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
