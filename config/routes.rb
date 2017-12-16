Rails.application.routes.draw do

  root 'photos#index'

  namespace :api do
    resources :photos, only: [:index] do

    end
  end

  resources :photos

end
