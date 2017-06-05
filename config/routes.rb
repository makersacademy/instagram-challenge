Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  #resources :users, :only => [:show]
  match 'users/:id' => 'users#show', via: :get

  resources :pictures do
    resources :comments
  end

  resources :pictures do
    member do
      put 'like', to: 'pictures#upvote'
      put 'dislike', to: 'pictures#downvote'
    end
  end

  root 'welcome#index'

end
