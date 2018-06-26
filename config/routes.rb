Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :posts do
    resources :comments
    member do
      get 'like'
      get 'unlike'
    end
  end

  root 'posts#index'
end
