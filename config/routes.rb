Rails.application.routes.draw do

  devise_for :users
  resources :pictures, shallow: true do
    resources :comments
    resources :likes
  end

  root 'pictures#index'

end
