```
As a user,
So I can look at more photos,
I want to be able to create an Instagram account.
```

- [X] Install Devise
  - [X] Add gem to gemfile
  
      ``` gem 'devise' ```
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

- [ ] Link Signup to Instagram homepage