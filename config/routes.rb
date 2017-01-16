Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }


  resources :photos, shallow: true do
    resources :comments
    resources :likes
  end

  root to: 'photos#index'

end
