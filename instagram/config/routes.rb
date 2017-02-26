Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'photos' => 'photos#index'
  resources :photos do
    resources :reviews
  end
  root "photos#index"
end
