Rails.application.routes.draw do

  get 'pictures/index'

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions"}

  resources :pictures do
     resources :comments
   end
   resources :users
   resources :comments
   root  "pictures#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
