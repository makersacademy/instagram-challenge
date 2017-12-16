Rails.application.routes.draw do
  resources :images

  get 'images/index'

  root 'images#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
