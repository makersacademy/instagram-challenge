Rails.application.routes.draw do

devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
get 'photos' => 'photos#index'
root to: 'photos#index'

resources :photos do
  resources :comments
  resources :likes
end

devise_scope :user do
end

end
