# Routes user_id
```
Prefix Verb   URI Pattern                                   Controller#Action
        new_user_session GET    /users/sign_in(.:format)                      devise/sessions#new
            user_session POST   /users/sign_in(.:format)                      devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)                     devise/sessions#destroy
           user_password POST   /users/password(.:format)                     devise/passwords#create
       new_user_password GET    /users/password/new(.:format)                 devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)                devise/passwords#edit
                         PATCH  /users/password(.:format)                     devise/passwords#update
                         PUT    /users/password(.:format)                     devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)                       devise/registrations#cancel
       user_registration POST   /users(.:format)                              devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)                      devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)                         devise/registrations#edit
                         PATCH  /users(.:format)                              devise/registrations#update
                         PUT    /users(.:format)                              devise/registrations#update
                         DELETE /users(.:format)                              devise/registrations#destroy
                   users GET    /users(.:format)                              users#index
                         POST   /users(.:format)                              users#create
                new_user GET    /users/new(.:format)                          users#new
               edit_user GET    /users/:id/edit(.:format)                     users#edit
                    user GET    /users/:id(.:format)                          users#show
                         PATCH  /users/:id(.:format)                          users#update
                         PUT    /users/:id(.:format)                          users#update
                         DELETE /users/:id(.:format)                          users#destroy
                    tags GET    /tags(.:format)                               tags#index
                         POST   /tags(.:format)                               tags#create
                 new_tag GET    /tags/new(.:format)                           tags#new
                edit_tag GET    /tags/:id/edit(.:format)                      tags#edit
                     tag GET    /tags/:id(.:format)                           tags#show
                         PATCH  /tags/:id(.:format)                           tags#update
                         PUT    /tags/:id(.:format)                           tags#update
                         DELETE /tags/:id(.:format)                           tags#destroy
          image_comments GET    /images/:image_id/comments(.:format)          comments#index
                         POST   /images/:image_id/comments(.:format)          comments#create
       new_image_comment GET    /images/:image_id/comments/new(.:format)      comments#new
      edit_image_comment GET    /images/:image_id/comments/:id/edit(.:format) comments#edit
           image_comment GET    /images/:image_id/comments/:id(.:format)      comments#show
                         PATCH  /images/:image_id/comments/:id(.:format)      comments#update
                         PUT    /images/:image_id/comments/:id(.:format)      comments#update
                         DELETE /images/:image_id/comments/:id(.:format)      comments#destroy
                  images GET    /images(.:format)                             images#index
                         POST   /images(.:format)                             images#create
               new_image GET    /images/new(.:format)                         images#new
              edit_image GET    /images/:id/edit(.:format)                    images#edit
                   image GET    /images/:id(.:format)                         images#show
                         PATCH  /images/:id(.:format)                         images#update
                         PUT    /images/:id(.:format)                         images#update
                         DELETE /images/:id(.:format)                         images#destroy
                    root GET    /                                             images#index
```
