Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "inztagram#index"
  
  get "/inztagram", to: "inztagram#index"

  get "about-us", to: "about#index", as: :about

end
