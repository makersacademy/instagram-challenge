Rails.application.routes.draw do
  post 'photo/store'
  root 'photo#index'
  get 'photo/index'
  get 'photo/store'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
