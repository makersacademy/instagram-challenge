Rails.application.routes.draw do
  get 'api/index'

  namespace :apicontroller do
    resources :images, only: [:index, :show] do

      end
    end

  resources :comments
  resources :images

  get 'images/index'

  root 'images#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
