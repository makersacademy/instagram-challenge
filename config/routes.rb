Rails.application.routes.draw do
  devise_for :users
  resources :feeds do
    resources :photos
  end
  resources :welcome


  # post '/feeds/:feed_id/photos/new'

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
