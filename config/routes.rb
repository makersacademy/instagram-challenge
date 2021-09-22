Rails
  .application
  .routes
  .draw do
    root 'posts#index', as: 'home'
    root 'posts#index', as: 'root'
    resources :posts
    resources :users
    resources :likes
    resources :comments
    resources :friends

    # root to: 'users#new'
    # get 'users/new' => 'users#new', :as => :new_user
    # post 'users' => 'users#create'

    # generate route to like post
    post '/like' => 'likes#create'

    # generate route to like post
    post '/unlike' => 'likes#destroy'

    # generate route to follow friend
    post '/follow' => 'friends#create'

    # generate route to unfollow friend
    post '/unfollow' => 'friends#destroy'

    # ----- add these lines here: -----

    # log in page with form:
    get '/login' => 'sessions#new'

    # create (post) action for when log in form is submitted:
    post '/login' => 'sessions#create'

    # delete action to log out:
    delete '/logout' => 'sessions#destroy'

    # ----- end of added lines -----
  end
