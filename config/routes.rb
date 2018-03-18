Rails.application.routes.draw do
  # devise_for :views
  devise_for :users
  resource :user do
    resources :pictures
  end


  root 'pictures#index'
end
