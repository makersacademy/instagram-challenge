Rails.application.routes.draw do
  devise_for :users
  resources :pictures do
    resources :comments
  end

  root 'pictures#index'
end
