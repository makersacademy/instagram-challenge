Rails.application.routes.draw do
get 'images' => 'images#index'
resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
