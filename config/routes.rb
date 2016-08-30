Rails.application.routes.draw do

  devise_for :users
  root 'photos#index'

  resources :photos do
    resources :comments
  end

end
