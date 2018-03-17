Rails.application.routes.draw do

  resources :images
  get '/' => 'images#index'

end
