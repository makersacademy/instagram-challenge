Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'pictures#index'

  resources :pictures do
    resources :comments
  end
end
