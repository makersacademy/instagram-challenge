Rails.application.routes.draw do
  resources :images
  devise_for :users
  resources 'entries'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources 'users'

  get 'followers/request/:id' => 'followers#request', :as => :follow_request
  get 'followers/requests' => 'followers#requests', :as => :follower_requests
  get 'followers/accept/:id' => 'followers#accept', :as => :accept_request
  get 'followers/decline/:id'=> 'followers#decline', :as => :decline_request

  root 'images#index'

end
