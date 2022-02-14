Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'home/index'
  root "home#index"
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:create, :new]
  resources :comments, only: [:create, :new]
end
