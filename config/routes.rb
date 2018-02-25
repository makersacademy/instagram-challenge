Rails.application.routes.draw do
  resources :picts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'picts#index'
end
