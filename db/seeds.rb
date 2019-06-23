# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'

user = User.create(first_name: "john", last_name: "snow", email: 'test@test.com', password: "password", password_confirmation: "password")

post = Post.create(description: "Skyline", likes: 1, user: user)

downloaded_image = open("https://images.unsplash.com/photo-1556209423-c0f478ab131a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")

post.image.attach(io: downloaded_image, filename: 'foo.jpg')

post = Post.create(description: "Beach", likes: 1, user: user)

downloaded_image = open("https://images.unsplash.com/photo-1556199127-fc052aca4d45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")

post.image.attach(io: downloaded_image, filename: 'beach.jpg')
