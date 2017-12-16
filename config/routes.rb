Rails.application.routes.draw do

  root "homepage#index"

  namespace :api do
    resources :images, only: [:index] do
    end
  end

    post 'api/reactions'


  resources :reactions, only: [:create] do

  end

  resources :likes, only: [:create] do

  end

end
