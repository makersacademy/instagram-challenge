Rails.application.routes.draw do
  devise_for :users

  resources :images do
    resources :likes
  end

  authenticated :user do
  root to: 'images#index'
end

  root to: redirect('/users/sign_in')
end
