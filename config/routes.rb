Rails.application.routes.draw do

  resources :images

  root to: 'images#index'
end
