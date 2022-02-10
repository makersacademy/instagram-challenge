Rails.application.routes.draw do
  
  root 'pictures#index'
  resources :pictures
<<<<<<< HEAD

  get '/users/new', to: 'users#new'
=======
  devise_for :users do 
    resources :pictures
  end
>>>>>>> cb84730 (Add login feature)
  
  # For details one DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
