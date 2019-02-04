Rails.application.routes.draw do
  devise_for :users
  root "pictures#index"
  
  resources :pictures do 
    member do 
      put "like", to: "picture#upvote"
    end
  end

end
