Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => redirect('/ideas')
  devise_for :users
  resources :comments
  get 'user/info'

  resources :ideas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
