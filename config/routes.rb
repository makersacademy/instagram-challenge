Rails.application.routes.draw do
  devise_for :users
  get 'travelgrams' => 'travelgrams#index'
  resources :travelgrams do
    resources :comments
  end
end
