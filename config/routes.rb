Rails.application.routes.draw do

  devise_for :users
  resources :filterspams do
    resources :comments
  end

  root 'filterspams#index'

end
