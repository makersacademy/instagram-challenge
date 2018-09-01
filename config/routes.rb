Rails.application.routes.draw do
  resources :pics
  root 'pics#index'
end
