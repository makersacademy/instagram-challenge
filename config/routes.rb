Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "instapics#index"

resources :instapics
end
