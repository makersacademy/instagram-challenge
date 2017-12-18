Rails.application.routes.draw do
  devise_for :users
  root 'photos#index'

  resources :photos

  defaults format: :json do
     namespace :api do
       resources :photos, only: [:index, :show] do
         resources :likes, only: [:index, :create]
         resources :comments, only: [:index, :create]
       end
     end
   end

end
