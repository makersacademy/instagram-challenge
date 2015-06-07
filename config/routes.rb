Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/users/:id' => 'users#show', :as => 'user'

  resources :posts do
    resources :comments
    resources :likes
  end
end
