Rails.application.routes.draw do
  root :to => 'pictures#index'
  devise_for :users
  resources :pictures do
    resources :comments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
