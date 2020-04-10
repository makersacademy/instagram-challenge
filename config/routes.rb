Rails.application.routes.draw do
  get 'picture/index'

  resources :pictures

  root 'picture#index'
end
