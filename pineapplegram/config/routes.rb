Rails.application.routes.draw do
  devise_for :users
  get 'pictures' => 'pictures#index'
  resources :pictures

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
