Rails.application.routes.draw do
  root 'pictures#index'
  get 'pictures/index', to: 'pictures#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
