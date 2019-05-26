Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'

  resources :posts do
    resources :comments
  end
  # It is common to have resources that are logically the children of other resources. Nested routes allow you to capture this in routes.
end
