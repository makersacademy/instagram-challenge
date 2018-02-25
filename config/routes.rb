Rails.application.routes.draw do
  resources :pict
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pict#index'
end
