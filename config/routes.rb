Rails.application.routes.draw do
  namespace :api do
    resources :users, :posts
    post '/login',     to: 'sessions#create'
    post '/logout',    to: 'sessions#destroy'
    get  '/logged_in', to: 'sessions#is_logged_in?'
  end

  root 'home#index'
  get  '/*path', to: 'home#index'
end
