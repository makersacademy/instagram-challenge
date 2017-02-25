Rails.application.routes.draw do
  devise_for :users

  resources :images, shallow: true do
    resources :comments
  end

  root "images#index"
end
