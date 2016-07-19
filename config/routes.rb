Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "posts#index"
  resources :posts do
    resources :comments
    resources :endorsements
  end
end
