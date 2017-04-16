Rails.application.routes.draw do
  resources :pictures
  devise_for :users
  root 'photos#index'
  get 'about' => 'photos#about'
end
