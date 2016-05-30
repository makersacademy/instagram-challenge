Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users,
      :controllers => { :registrations => 'registrations',
      :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :posts do
    resources :comments
  end


end
