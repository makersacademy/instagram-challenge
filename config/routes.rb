Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images do
    resources :comments
  end
  
  root "images#index"
end
