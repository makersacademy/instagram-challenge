Rails.application.routes.draw do
  resources :photos
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "home#index"
  resources :users, only: [:show] do
    resources :photo, only: [:new, :index, :show]
  end
  get '*path' => redirect('/')
end
