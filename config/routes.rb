Rails.application.routes.draw do
  devise_for :users
  get 'instagram/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'instagram#index'
end
