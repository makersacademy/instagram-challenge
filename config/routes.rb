Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  resources :bamposts
  resources :users
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
