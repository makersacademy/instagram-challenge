Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resource 'feed'

  resources :posts, only: [:new, :create] do
    member do
      get :picture
    end
  end
end
