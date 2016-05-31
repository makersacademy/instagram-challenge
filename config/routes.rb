Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users,
      :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations',
       }
  resources :posts do
    resources :comments
  end


end
