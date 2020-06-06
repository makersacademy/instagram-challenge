Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :posts
  get '/dashboard' => "accounts#index"
  root to: 'public#homepage'

end
