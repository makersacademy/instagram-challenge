Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

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
