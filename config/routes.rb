Rails.application.routes.draw do
  root "instapics#index"

resources :instapics
end
