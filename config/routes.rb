Rails.application.routes.draw do
  resources :pictures

  root 'pictures#index'
end
