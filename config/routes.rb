Rails.application.routes.draw do

  root "homepage#index"

  namespace :api do
    resources :images, only: [:index] do

    end
  end

  resources :reactions, only: [:create] do
    
  end

end
