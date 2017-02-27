# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 10.times do
#   FactoryGirl.create(:user)
# end
# require 'database_cleaner'
# DatabaseCleaner.strategy = :truncation
# DatabaseCleaner.clean

FactoryGirl.create_list(:user, 10)
FactoryGirl.create_list(:post, 10)
FactoryGirl.create_list(:comment, 10)
FactoryGirl.create(:user, username: "test", email: "test@test.com", password: "123456", password_confirmation: "123456")
