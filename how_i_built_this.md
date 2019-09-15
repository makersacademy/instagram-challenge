
## How I built this

Ruby version: 2.6.3
Rails version: 6
Directory: instagram-challenge


1. Installed Yarn for some reason
```bash
brew install yarn
```

2. Initialised rails
```bash
rails new . --database=postgresql --no-skip-gemfile --no-skip-git --skip-keeps --skip-action-mailer --skip-action-mailbox --skip-action-text --no-skip-active-record --no-skip-active-storage --no-skip-puma --skip-action-cable --skip-sprockets --skip-spring --skip-turbolinks --skip-test --skip-systemtest --skip-bootsnap --skip-webpack-install
```

3. DB Creation because postgres
```bash
rails db:create
```

4. Removed the webpacker gem from the Gemfile


5. Hello Rails!
```bash
rails server
```

6. Setting up Rspec and capybara
[Instructions](https://relishapp.com/rspec/rspec-rails/docs/gettingstarted)
```bash
bundle add rspec-rails -g=development,test
rails generate rspec:install
bundle add capybara -g=development,test
bundle add selenium-webdriver -g=development,test

```


7. Set up travis
Made a .travis.yml file

8. Set up heroku
```bash
gem install travis
travis encrypt $(heroku auth:token) --add deploy.api_key --pro
```

