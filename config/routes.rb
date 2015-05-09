Rails.application.routes.draw do
 devise_for :users
 root 'photos#index'
 get 'about' => 'photos#about'
end
