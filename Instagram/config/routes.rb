Rails.application.routes.draw do
  get 'homepage/index'

  root 'homepage#index'
end
