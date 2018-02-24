Rails.application.routes.draw do
  get 'homepage/index'
  resources :pictures do
    resources :comments
  end
  root 'homepage#index'
end
