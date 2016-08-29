# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jess = User.create!(username: "jess",
            email: 'test1@test.co.uk',
            password: "password",
            password_confirmation: "password")


matt = User.create!(username: "matt",
            email: 'test2@test.co.uk',
            password: "password",
            password_confirmation: "password")


lila = User.create!(username: "lila",
            email: 'test3@test.co.uk',
            password: "password",
            password_confirmation: "password")



jess.follow(lila)
jess.follow(matt)
lila.follow(jess)
lila.follow(matt)
