Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "instapics#index"

  resources :instapics, shallow: true do
    resources :likes
  end
end
