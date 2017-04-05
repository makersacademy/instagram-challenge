Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pictures, shallow: true do
    resources :comments
    resources :likes
  end

  root "pictures#index"
end
