Rails.application.routes.draw do

  root "photos#index"

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :photos do
    resources :comments
    resources :likes
  end

end
