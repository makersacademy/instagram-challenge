Rails.application.routes.draw do
  devise_for :users
  get 'pictures/index'

  resources :pictures do
    resources :comments
    resources :likes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pictures#index'
end
