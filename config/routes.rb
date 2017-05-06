Rails.application.routes.draw do
  resources :photos
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
   }
  root 'photos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
