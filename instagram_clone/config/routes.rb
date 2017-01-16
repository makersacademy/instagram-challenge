Rails.application.routes.draw do

  devise_for :users

  resources :photos do
    member do
      put "like", to: "photos#like"
    end
  end

  root 'photos#index'
end
