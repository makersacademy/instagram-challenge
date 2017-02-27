Rails.application.routes.draw do

  root "photos#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #avoids deep nesting as it builds routes with the minimal amounnt of information, balances between descriptive routes and deep nesting
  resources :photos, shallow: true do
    resources :comments
  end

end
