Rails.application.routes.draw do
  resources :pictures
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pictures#index'
end
