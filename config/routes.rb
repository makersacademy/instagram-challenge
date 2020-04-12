Rails.application.routes.draw do
  get 'picture/index'

  resources :users

  resources :pictures do
    resources :comments
  end

  root 'picture#index'

  get '/signup' => 'user#new'
  get '/users' => 'user#create'
end
