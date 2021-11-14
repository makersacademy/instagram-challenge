Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  resources :user_sessions
  root :to => "posts#index"
  get '/', to: 'posts#index', as: 'main_page'
  post 'like', to: 'home#like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
