Rails.application.routes.draw do
  get 'photos/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'photos#index'

end
