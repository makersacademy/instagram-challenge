Rails.application.routes.draw do

  root 'pages#home'


  devise_for :users

  get '/upload', to: 'images#new'
  resources :images, only: [:index, :show, :create]

  get '/:username', to: 'users#show', as: :profile
end
