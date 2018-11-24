Rails.application.routes.draw do
  devise_for :users
  get 'homepage/index'
  root 'homepage#index'
end
