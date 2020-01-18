Rails.application.routes.draw do
  resources :fatcats
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :images

  root 'fatcats#index'
end
