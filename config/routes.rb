Rails.application.routes.draw do
  devise_for :users
  root "pictures#index"
  
  resources :pictures do 
    member do 
      put "like", to: "pictures#upvote"
    end
  end

end
