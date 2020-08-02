Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/secret', to: 'pages#secret', as: :secret

  root to: 'pages#index'
end
