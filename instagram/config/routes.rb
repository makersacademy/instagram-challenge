Rails.application.routes.draw do

  resources :images 
  root "images#index"

end
