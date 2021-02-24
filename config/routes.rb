Rails.application.routes.draw do

  devise_for :users
  # Suggested root_url by Devise set up
  root to: "home#index"
end

