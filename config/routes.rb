Rails.application.routes.draw do
  root "timeline#index"

  get "/timeline", to: "timeline#index"

end
