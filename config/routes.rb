Rails.application.routes.draw do
  resources :users
  root :to => "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
