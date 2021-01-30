Rails.application.routes.draw do

  root 'welcome#index'

  # create new user form and post details
  get 'users/new'
  post 'users', to: "users#create"
  # individual user homepage (personalised URL)
  get 'users/:username', to: "users#username"

end
