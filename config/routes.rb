Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root :to => 'profiles#index'
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :profiles, :path => ''

  resources :posts, shallow: true do
    resources :likes
    resources :comments
  end

end
