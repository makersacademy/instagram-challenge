Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :images, shallow: true do
    resources :comments
  end

  root "images#index"
end
