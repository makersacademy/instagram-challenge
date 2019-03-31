Rails.application.routes.draw do
  get 'adding_post/index'
  get 'adding_post/index', to: 'adding_post#create'
  post 'adding_post/index', to: 'adding_post#create'
  get 'adding_post/update', to: 'adding_post#update'

  resources :adding_post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'adding_post#index'

end
