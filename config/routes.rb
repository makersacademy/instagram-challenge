Rails.application.routes.draw do
  devise_for :users
  get 'site/home'
  resources :posts

  resources :posts do
    resources :comments
  end

  resources :posts do
    resources :likes
  end
  
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
