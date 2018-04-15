Rails.application.routes.draw do
  get 'home/front'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#front'
end
