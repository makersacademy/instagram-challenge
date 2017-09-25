Rails.application.routes.draw do

  resources :profiles
  resources :snaps do
    member do
      put 'like' => 'snaps#upvote'
      put 'unlike' => 'snaps#downvote'
    end
    resources :comments
  end

  root "snaps#home", page: "home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
