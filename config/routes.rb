Rails.application.routes.draw do
  resources :posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: "posts#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
end
