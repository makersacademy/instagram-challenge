Rails.application.routes.draw do

  resources :pictures, shallow: true do
    resources :comments
  end

  root 'pictures#index'

end
