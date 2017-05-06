Rails.application.routes.draw do
  get 'travelgram' => 'travelgram#index'
  resources :travelgram
end
