Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # get 'pictures' => 'picture#index'
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
