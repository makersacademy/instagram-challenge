1. set heroku secret key 
2. install imagemack for resizing (brew install on mac)


heroku buildpacks:set https://github.com/heroku/heroku-buildpack-ruby
heroku buildpacks:add --index 1 https://github.com/ello/heroku-buildpack-imagemagick