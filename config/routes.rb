Rails.application.routes.draw do

  devise_for :users
  
  as :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :pics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pics#index"
end
