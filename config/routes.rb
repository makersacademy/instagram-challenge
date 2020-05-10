Rails.application.routes.draw do
  resource :sessions, only: [:index, :new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :posts, shallow: true do
      resources :comments
      resources :likes, shallow: false
    end
  end
  root 'sessions#index'
end
