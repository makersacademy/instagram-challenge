Rails.application.routes.draw do
  resources :pictures
  devise_for :users
  # get 'pictures/index', to: 'pictures#index'
  get '/pictures', to: redirect('/')
  get '/pictures/:id', to: redirect('pictures#show')

  root 'pictures#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
