Rails.application.routes.draw do
  get 'homepage/index'
  resources :pictures
  root 'homepage#index'
end
