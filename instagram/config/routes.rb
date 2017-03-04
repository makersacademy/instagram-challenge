Rails.application.routes.draw do
  get 'posts/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images do
    resources :likes
    resources :comments
  end

  root 'images#index'
end
