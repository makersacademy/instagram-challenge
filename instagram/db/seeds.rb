# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    
    { username: 'OBenson',
      email: 'olivia_b0@example.com',
      password: '12345',
    },
    { username: 'Oddpotato',
      email: 'oddpotato@example.com',
      password: '12345',
    },
    { username: 'panyd',
      email: 'panyd@example.com',
      password: '12345',
    }]

    users.each { |user| User.create(user) }