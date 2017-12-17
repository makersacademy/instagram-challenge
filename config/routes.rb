Rails.application.routes.draw do
  root 'photos#index'

  resources :photos

  defaults format: :json do
     namespace :api do
       resources :photos, only: [:index, :show]
     end
   end

end
