Rails.application.routes.draw do
  devise_for :users
  resources 'entries'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources 'users'

  get 'followers/request/:id' => 'followers#request', :as => :follow_request

  root 'entries#index'

end
