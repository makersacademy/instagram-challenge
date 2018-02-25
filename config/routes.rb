Rails.application.routes.draw do
  root to: "photos#index"
  resources :photos
end
