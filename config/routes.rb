Rails
  .application
  .routes
  .draw do
    root 'users#index', as: 'home'
    resources :posts
    resources :users
  end
