Rails.application.routes.draw do
  get 'photos' => 'photos#index'
  resources :photos
end
