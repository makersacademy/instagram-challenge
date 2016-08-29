Rails.application.routes.draw do

  root 'photos#index'

  resources :photos do
    resources :comments
  end

end
