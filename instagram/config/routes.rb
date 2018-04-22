Rails.application.routes.draw do
  resources :comments
  resources :photos
  root to: redirect('/photos')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
