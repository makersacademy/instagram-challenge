Rails.application.routes.draw do

  root 'feed#index'

  get '/users' => 'users#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :photos do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

  scope ':username' do
    root 'users#show', as: 'feed'
    post '/follow', to: 'follows#create', as: 'new_follow'
    delete '/follow', to: 'follows#destroy', as: 'delete_follow'
  end

end
