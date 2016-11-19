Rails.application.routes.draw do

  root 'galleries#index'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'gallery' => 'galleries#index'

  resources :galleries
end
