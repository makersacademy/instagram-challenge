Rails.application.routes.draw do

  resources :filterspams

  root 'filterspams#index'

end
