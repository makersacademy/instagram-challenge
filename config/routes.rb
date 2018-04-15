Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'posts/index'

  resources :posts
  root 'posts#index'
end
