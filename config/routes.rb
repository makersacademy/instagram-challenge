Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'user_posts/:user_id' => 'posts#user', as: :user_posts

  resources :posts do
    resources :likes
  end

  root 'posts#index'
end
