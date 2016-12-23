Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'pictures#index'

  resources :pictures, shallow: true do
    resources :comments
  end

  resources :users

  get ':user_name', to: 'profiles#show', as: :profile

end
