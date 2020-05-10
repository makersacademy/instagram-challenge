Rails.application.routes.draw do
  devise_for :users
  get 'site/home'
  resources :posts

  root "site#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
