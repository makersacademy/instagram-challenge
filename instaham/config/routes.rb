Rails.application.routes.draw do
  resources :hams

  root 'hams#index'
end
