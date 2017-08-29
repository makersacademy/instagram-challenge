Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :albums
  resources :profiles
  resources :pictures


  get 'home/index'

  authenticated :user do
    root to: 'profiles#show', as: :authenticated_root
  end

  devise_scope :user do
  root to: "devise/sessions#new"
  end

end
