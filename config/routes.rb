Rails.application.routes.draw do
  resources :posts
  get 'home_page/home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home_page#home'
end
