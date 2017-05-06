Rails.application.routes.draw do
  get 'travelgrams' => 'travelgrams#index'
  resources :travelgrams do
    resources :comments
  end
end
