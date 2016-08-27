Rails.application.routes.draw do

  root 'feed#index'


  devise_for :users

  resources :photos

  get '/:username', to: 'users#show'

end
