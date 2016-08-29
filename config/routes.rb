Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users


  get 'profile', to: :show, controller: 'users'

  resources :posts do
    resources :comments
    resources :likes
    resources :tags
  end

end
