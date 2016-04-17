Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'images#index'
  resources :images do
    resources :comments
  end
end
