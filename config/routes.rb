Rails.application.routes.draw do
  devise_for :users
  resources :comments
  root to: redirect('instaposts')
  get '/spams' => 'instaposts#show'
  get 'pages/about'
  resources :instaposts do
    member do
      put "like", to: "instaposts#upvote"
      put "dislike", to: "instaposts#downvote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
