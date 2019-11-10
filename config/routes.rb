Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :posts do
    member do
      put 'like', to: "posts#like"
    end
    resources :comments do
    end
  end
end
