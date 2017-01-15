Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }


  resources :photos do
    resources :comments
  end

  root to: 'photos#index'
  
end
