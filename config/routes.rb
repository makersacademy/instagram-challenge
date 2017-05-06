Rails.application.routes.draw do

  devise_for :users
  root "pictures#index"

  get 'pictures' => 'pictures#index'

  resources :pictures do
    resources :comments
  end



end
