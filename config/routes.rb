Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pictures do
    resources :comments, :only => [:new, :create, :destroy]
    member do
     get 'like'
   end
  end

  root "pictures#index"
end
