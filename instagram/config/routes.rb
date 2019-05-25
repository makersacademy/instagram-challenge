Rails.application.routes.draw do
  root "welcome#index"
  get "/", to: "welcome#index"
end
