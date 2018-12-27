Rails.application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"

end
