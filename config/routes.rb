Rails.application.routes.draw do
  devise_for :users

  resources :photos, shallow: true do
    resources :comments
    resources :likes
  end

  root to: 'photos#index'
end
