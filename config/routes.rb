Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :photos

  root 'photos#index'

  get  '/session/new' => 'sessions#new'
  post '/session/new' => 'sessions#create'
  get  '/session/destroy' => 'sessions#destroy'

  get  '/users/new' => 'users#new'
  post '/users' => 'users#create'

end
