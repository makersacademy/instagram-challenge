Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'gallery' => 'galleries#index'
  root 'galleries#index'
  resources :galleries
end
