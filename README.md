Instagram Challenge
===================

```

──▄█████████████████████████▄──
▄█▀░█░█░█░░░░░░░░░░░░░░░░░░░▀█▄
█░░░█░█░█░░░░░░░░░░░░░░█████░░█
█░░░█░█░█░░░░░░░░░░░░░░█████░░█
█░░░█░█░█░░░░░░░░░░░░░░█████░░█
█░░░░░░░░░▄▄▄█████▄▄▄░░░░░░░░░█
███████████▀▀░░░░░▀▀███████████
█░░░░░░░██░░▄█████▄░░██░░░░░░░█
█░░░░░░░██░██▀░░░▀██░██░░░░░░░█
█░░░░░░░██░██░░░░░██░██░░░░░░░█
█░░░░░░░██░██▄░░░▄██░██░░░░░░░█
█░░░░░░░██▄░▀█████▀░▄██░░░░░░░█
█░░░░░░░░▀██▄▄░░░▄▄██▀░░░░░░░░█
█░░░░░░░░░░▀▀█████▀▀░░░░░░░░░░█
█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
▀█▄░░░░░░░░░░░░░░░░░░░░░░░░░▄█▀
──▀█████████████████████████▀──
```


## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## User Stories

```
As a user, 
So that I can post as me, 
I would like to be able to create an account

As a user, 
So that I can show people what I've been up to, 
I would like to be able to post pictures to Instagram

As a user,
So that I can reply to peoples pictures, 
I would like to be able to post comments on peoples pictures

As a user, 
So that I can show my friends some love, 
I would like to be able to like a picture

```


## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
group :development, :test do
  gem 'rubocop', '1.20', require: false
  gem 'rubocop-rails'
end
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
