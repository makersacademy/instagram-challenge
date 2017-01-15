Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "contributions#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'contributions' => 'contributions#index'

  resources :contributions do
    resources :comments do
    end
    resources :likes do
    end
  end

end
