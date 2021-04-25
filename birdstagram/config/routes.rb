Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'posts#index'
  resources :users
  resources :posts
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
end
