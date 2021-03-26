Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
end
