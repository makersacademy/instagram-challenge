Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'photos#index'
  get 'photos' => 'photos#index'
  resources :photos do
    resources :comments
    resources :likes
  end
end
