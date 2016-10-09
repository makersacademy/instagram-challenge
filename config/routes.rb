Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  resources :pictures do
    resources :comments
  end

  root 'pictures#index'

end
