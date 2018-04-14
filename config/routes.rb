Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  resources :pictures do
    resources :comments
  end

  root 'pictures#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
