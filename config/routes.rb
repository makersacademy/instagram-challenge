Rails.application.routes.draw do
  devise_for :users, controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }
  resources :pictures
  root to: "pictures#index"

end
