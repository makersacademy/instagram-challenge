Rails.application.routes.draw do
  resources :photos
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "home#index"
  resources :users, only: [:show]
  resources :photos, only: [:new, :index, :show] do
      resources :comments
  end
  get '*path' => redirect('/')
  match :like, to: 'likes#create', as: :like, via: :post
end
