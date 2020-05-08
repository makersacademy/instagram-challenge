```
As a user,
So I can visit Instagram,
I want to be view the Instagram homepage.
```

- [X] Setup Rails
  
   ``` rails new * ```

- [X] Setup rspec
  
    ``` rails generate rspec:install ```
- [X] Setup Instagram Controller

    ``` rails generate controller Instagram index ```
- [X] Setup Routes

  In config/routes.rb

  ``` root 'instagram#index' ```