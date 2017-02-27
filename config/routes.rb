Rails.application.routes.draw do

  root "posts#index"
  get 'posts/index'

  get 'posts' => 'posts#index'
  devise_for :users
  resources :posts, shallow: true  do
    resources :comments
    resources :woofs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
