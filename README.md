1. set heroku secret key 
2. install imagemack for resizing (brew install on mac)
3. heroku run rails db:migrate
heroku buildpacks:set https://github.com/heroku/heroku-buildpack-ruby
heroku buildpacks:add --index 1 https://github.com/ello/heroku-buildpack-imagemagick