Rails.application.routes.draw do
  mount Commontator::Engine => '/commontator'
  get 'photo/new'
  get 'photo/index'
  get 'photo/store'
  post 'photo/store'
  root to: 'photo#index'
  devise_for :users
  resources :users
end
