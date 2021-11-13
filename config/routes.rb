Rails.application.routes.draw do
  resources :users
  resources :user_sessions
  root :to => "home#index"
  get '/', to: 'home#index', as: 'main_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
