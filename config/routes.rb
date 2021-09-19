Rails.application.routes.draw do
  root 'user#index'
  get 'user/signup'
end
