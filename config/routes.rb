Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  resources :posts do
    resources :comments
    resources :likes
  end
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/session#destroy', :as => :destroy_user_session
  # end
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
