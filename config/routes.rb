Rails.application.routes.draw do

  devise_for :users
  root 'feed#index'

end
