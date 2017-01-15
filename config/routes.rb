Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  
  root 'pictures#index'

  get 'pictures' => 'pictures#index'

  resources :pictures do
    resources :comments
  end
end
