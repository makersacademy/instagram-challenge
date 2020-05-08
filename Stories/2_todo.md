```
As a user,
So I can look at more photos,
I want to be able to create an Instagram account.
```

- [X] Install Devise
  - [X] Add gem to gemfile
  - [X] Add Factory bot
  
      ``` gem 'devise' ```
      ``` gem 'factory_bot_rails' ```
      ``` bundle ```
  - [X] Install devise

    ``` rails generate devise:install```
  - [ ] Define url for development enviromnet
    At the top of config/environments/development.rb:
    ```  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 } ```

- [X] Create user with devise

    ``` rails generate devise user ```

- [X] Update Database

    ``` rails db:migrate ```

- [X] Link Signup to Instagram homepage
- [X] Add First Name, Last Name and Username fields to user
  - [X] Create migration
  
        ``` rails generate migration add_name_to_users first_name:string, last_name:string, username:string ```
  - [X] Run migration
  
      ``` rails db:migrate ```
  - [X] Add views to devise user
  
        ``` rails generate devise:views ```
  - [X] Add fields to views/devise/registrations/new.html.erb
  - [X] Update application to include new user parameters
        in app/controllers/application_controller.rb
        
``` 
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])
  end
```