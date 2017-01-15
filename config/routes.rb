Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "pictures#index"
  end

  # get 'pictures' => 'picture#index'
  resources :pictures do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
