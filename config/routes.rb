Rails.application.routes.draw do
  get 'photo/index'
  get 'photo/store'


  Rails.application.routes.draw do
    post 'photo/store'
    root 'photo#index'
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/index'


end
