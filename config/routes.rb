Rails.application.routes.draw do
  devise_for :users

  get 'posts/index'

  resources :posts do
    resources :comments, :likes, :image
  end

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
