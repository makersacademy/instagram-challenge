Rails.application.routes.draw do
  get 'picture/index'

  resources :pictures do
    resources :comments
  end

  root 'picture#index'
end
