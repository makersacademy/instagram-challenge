Rails.application.routes.draw do
  root "pictures#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pictures do
    resources :comments
  end
end
