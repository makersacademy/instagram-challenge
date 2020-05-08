```
As a user,
So that I can access my account,
I want to be able to sign in to Instagram.
```

- [X] Add sign in link to homepage
      ``` <%= link_to('Sign in', new_user_session_path)  %> ```
- [ ] Allow user to log in with username and password
  - [X] Change fields in sign in page
    in app/views/devise/sessions/new.html.erb change email field to username
  - [X] Add sign in options to application controller
        in app/controllers/application_controller.rb
        ```  devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :first_name, :last_name]) ```
  - [X] Allow authentication from username
      in config/initializers/devise.rb
      ``` config.authentication_keys = [:username] ```