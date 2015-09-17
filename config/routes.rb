Rails.application.routes.draw do
  devise_for :users

  resources :photos do
    resources :comments
  end

  root to: 'photos#index'
end
