Rails.application.routes.draw do

  devise_for :users do
    resources :photos
  end
  root to: 'dashboard#index'
end
