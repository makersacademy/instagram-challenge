Rails.application.routes.draw do

  devise_for :users
  resources :photos
  resources :likes
  resources :comments


  get '/' => 'photos#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
