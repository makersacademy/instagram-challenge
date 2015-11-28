Rails.application.routes.draw do

  get 'images' => 'images#index'

  resources :images

end
