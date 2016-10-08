Rails.application.routes.draw do
  resources :photo
  resources :photo do
    resources :comment, only: [:index, :new, :create, :destroy]
  end
  root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
