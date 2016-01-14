Rails.application.routes.draw do

  devise_for :users
  
  resources :filterspams do
    resources :comments
    resources :likes
  end

  root 'filterspams#index'

end
