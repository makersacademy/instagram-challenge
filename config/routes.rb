Rails.application.routes.draw do

  post 'photo/store'
  root 'photo#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
