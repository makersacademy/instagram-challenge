Rails.application.routes.draw do

  # devise_for :users
  resources :images do
    resources :comments
    resources :likes
  end

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "images#index"

end
