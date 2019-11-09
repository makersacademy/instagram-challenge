Rails.application.routes.draw do
  get 'pics/new'
  get 'pics/index'
  get 'pics/show'
  get 'pics/edit'
  get 'pics/update'
  get 'pics/destroy'
  devise_for :users
  get 'home/index'

  root to: 'home#index'
end
