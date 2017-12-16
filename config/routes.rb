Rails.application.routes.draw do

  root 'photos#index'

  namespace :api do
    resources :photos, only: [:index, :show] do

    end
  end

  resources :photos do
    resources :comments do

    end
  end

end
