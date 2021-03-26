Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'posts#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
end
