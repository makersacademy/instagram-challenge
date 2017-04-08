Rails.application.routes.draw do

  devise_for :users
  resources :images do
    member do 
      put "like", to: "images#upvote"
    end 
  end 
  root "images#index"

end
