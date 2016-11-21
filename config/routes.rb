Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :pictures do
    resources :comments
    resources :likes
  end

  # STATIC ROUTES
  get  '/signup',  to: 'users#new'
end
