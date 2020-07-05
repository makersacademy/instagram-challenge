# README

## Testing Options

file structure to 'spec' and use bundle exec rspec
done via ```rails generate rspec:install```

## Image File
How to add image functionality;
reading... [this](https://medium.com/@anaharris/how-to-add-image-upload-functionality-to-your-rails-app-9f7fc3f3d042)

Added images via ActiveStorage. Spiked

## Comments
Also spiked comments. (checked that owners can delete both comments and posts)
couldn't get cascade delete working so have coded deleting comments before the post deletes due to the foreign key linking them.
Comments are bundled into the posts route and controller atm.

## How to run.

setup:
```
bundle install
bin/rails db:create
bin/rails db:migrate
```

run:
```
rails server
```

app is on ```localhost:3000```
