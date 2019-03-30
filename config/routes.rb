Rails.application.routes.draw do
  resources :comments
  resources :likes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root  'posts#index'

  resources :posts

end
