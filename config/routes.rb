Rails.application.routes.draw do
  devise_for :users, controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }
  resources :pictures, shallow: true do
    resources :comments do
      
    end
  end
  root to: "pictures#index"

end
