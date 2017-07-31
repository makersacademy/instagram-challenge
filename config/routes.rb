Rails.application.routes.draw do
  get 'home/index'


  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :only => [:show] do
    resources :posts, :only => [:new, :create] do
      resources :comments, :only => [:new, :create]
    end
  end

  root to: "home#index"
end
