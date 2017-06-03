Rails.application.routes.draw do

  root to: 'home#index'



  post '/sessions' => 'sessions#create'
  get 'sessions/destroy'

  get 'users/new'
  post '/users' => 'users#create'

  get 'sessions/new'
  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
