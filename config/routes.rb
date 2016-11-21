Rails.application.routes.draw do
  devise_for :users

  root to: "pictures#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pictures do
    resources :comments
    resources :likes, shallow: true
  end
end
