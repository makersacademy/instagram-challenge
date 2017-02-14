Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pictures' => 'pictures#index'
  root "pictures#index"
  resources :pictures do
    resources :comments
    resources :likes

  end

end
