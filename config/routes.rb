Rails.application.routes.draw do

  get 'posts/index'
  devise_for :users
  root to: "posts#index"

<<<<<<< HEAD
  resources "posts"
=======
  get "*missing" => redirect("/")
>>>>>>> 58698ad2cf7d1a26aa7f333678f167cc6f671e8e

end
