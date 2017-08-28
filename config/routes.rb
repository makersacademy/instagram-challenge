Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'

  resources :posts
  root 'posts#index'

  resources :users
  resources :posts do
    resources :comments
    #resources :likes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
