Rails.application.routes.draw do
  get 'travelgrams' => 'travelgrams#index'
  resources :travelgrams
end
