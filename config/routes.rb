Rails.application.routes.draw do
  root :to => "users#new"
  resources :users, only: [:new, :create, :show] do
    resources :images, only: [:new, :create, :index]
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
