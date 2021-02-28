Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :welcome
end
