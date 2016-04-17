Rails.application.routes.draw do

  devise_for :users
  resources :pictures, shallow: true do
    resources :comments
  end

  root 'pictures#index'

end
