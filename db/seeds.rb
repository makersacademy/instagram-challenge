# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
#  alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_bob = User.create(
  email: 'bob@bob.com',
  password: 'bbbbbbb',
  username: 'bob',
  first_name: 'Bob',
  last_name: 'Bobson')
user_jim = User.create(
  email: 'jim@jim.com',
  password: 'jjjjjjj',
  username: 'jim',
  first_name: 'Jim',
  last_name: 'Jimson')
