# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

99.times do |n|
  username  = "username-#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: username,
              email: email,
              password:              password,
              password_confirmation: password,
              )
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
