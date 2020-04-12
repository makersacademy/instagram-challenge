Rails.application.routes.draw do
  root 'pictures#index'

  get 'pictures/index'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users

  resources :pictures do
    resources :comments
    resources :likes
  end


end
