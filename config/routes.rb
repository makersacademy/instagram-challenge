Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do

    get '/users', to: 'devise/registrations#new'

    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :posts do
    resources :comments
  end
  
  resources :likes

end
