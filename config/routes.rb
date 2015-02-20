Rails.application.routes.draw do
 
  devise_for :users
  resources :pictures

  devise_scope :user do
    authenticated :user do
      root 'pictures#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
