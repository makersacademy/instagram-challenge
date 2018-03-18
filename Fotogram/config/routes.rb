Rails.application.routes.draw do
  root "pictures#index"
  resources :pictures
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
end
