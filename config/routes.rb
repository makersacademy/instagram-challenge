Rails.application.routes.draw do

  get 'likes/create'

  root 'feed#index'


  devise_for :users

  resources :photos do
    resources :likes, only: [:create]
  end

  get '/:username', to: 'users#show'

end
