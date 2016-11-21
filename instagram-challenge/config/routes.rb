Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "instagram#index"

 resources :instagram
 
  resources :pictures do
    resources :comments
    resources :endorsements
  end


end
