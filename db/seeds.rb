# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1, user2 = User.new, User.new
user1.email = "lint@lint.com"
user2.email = "linter@linter.com"
user1.password = "iLoveLint"
user2.password = "iLoveLintToo"
[user1, user2].each(&:save!)
