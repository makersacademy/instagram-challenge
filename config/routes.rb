Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pictures' => 'pictures#index'
  resources :pictures
  resources :posts
  root 'posts#index'
end
