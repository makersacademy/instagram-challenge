Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :auth, only: %i[create]
      resource :users, only: %i[create]
    end
  end

  root 'home#index'
  get '*path', to: 'home#index'
end
