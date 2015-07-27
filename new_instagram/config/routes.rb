Rails.application.routes.draw do
  root to: "pictures#index"
  
  resources :pictures do
    resources :comments
  end
  
  devise_for :users
end
