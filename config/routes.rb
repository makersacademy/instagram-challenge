Rails.application.routes.draw do
  resources :photos
  resources :widgets
  devise_for :users, :controllers => { registrations: 'registrations'}
  get 'welcome/index'

  root 'welcome#index'

  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
