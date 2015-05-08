Rails.application.routes.draw do
 root 'photos#index'
 resources :photos
 get 'about' => 'photos#about'
end
