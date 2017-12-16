Rails.application.routes.draw do
  get 'photos/index'
  root 'photos#index'
end
