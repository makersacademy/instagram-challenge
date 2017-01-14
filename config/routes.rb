Rails.application.routes.draw do

  root 'pictures#index'

  get 'pictures' => 'pictures#index'

  resources :pictures do
    resources :comments
  end
end
