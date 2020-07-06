Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :users, only: [:new, :create] do
    resources :posts
  end
end