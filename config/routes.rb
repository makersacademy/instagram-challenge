Rails.application.routes.draw do
  get 'pages/home'
  resources :insta_posts
  # database this automatically added on db:migrate 
  root to: redirect('pages/home')
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html