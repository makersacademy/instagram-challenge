Rails.application.routes.draw do

  resources :filterspams

  get '' => 'filterspams#index'

end
