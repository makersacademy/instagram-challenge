Rails.application.routes.draw do
  devise_for :users
  get '/:id/wall', to: 'users#show', as: :user_wall
  resources :photos do
    resources :comments
    member do
      put "like", to: "photos#like"
      put "unlike", to: "photos#unlike"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "photos#index"
end
