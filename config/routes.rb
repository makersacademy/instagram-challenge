Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup'}
  

  get 'home/index'

  root 'photo#index'
  post 'photo/store'
  
end
