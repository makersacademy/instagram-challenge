Rails.application.routes.draw do

  get 'homepage/index'

  root "homepage#index"

  namespace :api do
    resources :images, only: [:index] do
    end
  end

end
